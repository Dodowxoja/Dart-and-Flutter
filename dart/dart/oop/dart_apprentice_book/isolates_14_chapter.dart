import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

// void main(List<String> args) async {
//   // print(playHideAndSeekTheLongVersion());
//   final receivePort = ReceivePort();

//   final isolate = await Isolate.spawn<SendPort>(
//     playHideAndSeekTheLongVersion,
//     receivePort.sendPort,
//   );

//   await for (final message in receivePort) {
//     if(message==null){
//       isolate.kill();
//       break;
//     };
//     print(message);
//   }

// }

// void playHideAndSeekTheLongVersion(SendPort sendPort) {
//   sendPort.send("You called isolate function");
//   var counting = 0;
//   sendPort.send("Counting started...");
//   for (var i = 1; i < 1_000_000_000; i++) {
//     counting = i;
//   }
//   final message = "$counting! Ready or not, here I come!";
//   sendPort.send(message);
//   sendPort.send(null);
// }

class Work {
  Future<int> doSomething() async {
    print("doing some work...");
    sleep(Duration(seconds: 1));
    return 42;
  }

  Future<int> doSomethingElse() async {
    print("doing some other work...");
    sleep(Duration(seconds: 1));
    return 24;
  }
}

Future<void> _entryPoint(SendPort sendPortToEarthPort) async {
  final receiveOnMarsPort = ReceivePort();
  sendPortToEarthPort.send(receiveOnMarsPort.sendPort);
  final work = Work();

  receiveOnMarsPort.listen((messageFromEarth) async {
    await Future<void>.delayed(Duration(seconds: 1));
    print("Message from Earth: $messageFromEarth");

    if (messageFromEarth == "Hey from Earth") {
      sendPortToEarthPort.send("Hey from Mars");
    } else if (messageFromEarth == "Can you help?") {
      sendPortToEarthPort.send("sure");
    } else if (messageFromEarth == "doSomething") {
      final result = await work.doSomething();
      sendPortToEarthPort.send({"method": "doSomething", "result": result});
    } else if (messageFromEarth == "doSomethingElse") {
      final result = await work.doSomethingElse();
      sendPortToEarthPort.send({"method": "doSomethingElse", "result": result});
      sendPortToEarthPort.send("done");
    }
  });
}

class Earth {
  final _receiveOnEarthPort = ReceivePort();
  SendPort? _sendToMarsPort;
  Isolate? _marsIsolate;

  Future<void> contactMars() async {
    if (_marsIsolate != null) return;

    _marsIsolate = await Isolate.spawn<SendPort>(
      _entryPoint,
      _receiveOnEarthPort.sendPort,
    );

    _receiveOnEarthPort.listen((Object? messageFromMars) async {
      await Future<void>.delayed(Duration(seconds: 1));
      print("Message from Mars: $messageFromMars");

      if (messageFromMars is SendPort) {
        _sendToMarsPort = messageFromMars;
        _sendToMarsPort?.send("Hey from Earth");
      } else if (messageFromMars == "Hey from Mars") {
        _sendToMarsPort?.send("Can you help?");
      } else if (messageFromMars == "sure") {
        _sendToMarsPort?.send("doSomething");
        _sendToMarsPort?.send("doSomethingElse");
      } else if (messageFromMars is Map) {
        final method = messageFromMars['method'] as String;
        final result = messageFromMars['result'] as int;
        print("The result of $method is $result");
      } else if (messageFromMars == "done") {
        print("shutting down");
        dispose();
      }
    });
  }

  void dispose() {
    _receiveOnEarthPort.close();
    _marsIsolate?.kill();
    _marsIsolate = null;
  }
}

// void main(List<String> args) async{
//   final earth = Earth();
//   await earth.contactMars();
// }

// Challenges
// Challenge 1: Fibonacci From Afar

void findNth(Map<String, Object> args) {
  int n1 = 1;
  int nth = 1;
  for (int i = 3; i <= (args['n'] as int); i++) {
    final temp = nth;
    nth += n1;
    n1 = temp;
  }
  Isolate.exit(args['sendPort'] as SendPort, nth);
}

Future<void> mainIsolate(int n) async {
  var receivePort = ReceivePort();

  await Isolate.spawn<Map<String, Object>>(findNth, {
    "sendPort": receivePort.sendPort,
    "n": n,
  });
  final message = await receivePort.first as int;
  print(message);
}

// Challenge 2: Parsing JSON
void parseJson(Map<int, Object> args) {
  Isolate.exit(args[0] as SendPort, jsonDecode(args[1] as String));
}

Future<void> parser(String json) async {
  var receivePort = ReceivePort();

  await Isolate.spawn<Map<int, Object>>(parseJson, {
    0: receivePort.sendPort,
    1: json,
  });

  final message = await receivePort.first;
  print(message);
}

void main(List<String> args) async {
  const jsonString =
      """{"language": "Dart","feeling": "love it","level": "intermediate"}""";
  await mainIsolate(14);
  await parser(jsonString);
}

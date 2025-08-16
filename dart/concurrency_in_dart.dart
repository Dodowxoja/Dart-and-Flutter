import 'dart:isolate';

// *** Key Concurrency Features in Dart ***

// 1. Futures - For handling single asynchronous operations
// 2. Async/await - Syntactic sugar making asynchronous code more readable
// 3. Streams - For handling sequences of asynchronous events
// 4. Isolates - For true parallel execution

// *  Futures and async/await *
// Futures represent a value that will be available in the future.
// The async/await syntax makes working with Futures more intuitive:

Future<String> fetchUserData() async {
  // Simulate network request
  await Future.delayed(Duration(seconds: 2));
  return "User data loaded";
}

// void main(List<String> args) async {
//   print("Loading...");
//   String data = await fetchUserData();
//   print(data);
// }

// *  Streams *
// Streams are ideal for handling sequences of events over time,
// like user input or data from a web socket:

Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

// void main(List<String> args) async {
//   Stream<int> stream = countStream(5);
//   await for (var number in stream) {
//     print(number);
//   }
//   print("Stream completed");
// }

// *  Isolates  *
// For CPU-intensive tasks, you can use isolates to run code in parallel:

void computeIntensiveTask(SendPort sendPort) {
  // Do intensive computation
  int result = 0;
  for (int i = 0; i < 1000000000; i++) {
    result += i;
  }
  sendPort.send(result);
}

// Future<void> main() async {
//   final receivePort = ReceivePort();

//   await Isolate.spawn(computeIntensiveTask, receivePort.sendPort);

//   final result = await receivePort.first;
//   print("Computation result: $result");
// }

// - Isolate Communication -
// Since isolates don't share memory, they communicate by passing messages through ports:

void isolateFunction(SendPort mainSendPort) async {
  // Create a receive port for incoming messages
  final receivePort = ReceivePort();

  // Send the send port to the main isolate
  mainSendPort.send(receivePort.sendPort);

  // Listen for messages
  await for (var message in receivePort) {
    if (message is String) {
      print("Isolate received: $message");
      mainSendPort.send("Processed $message");
    } else if (message == 'close') {
      break;
    }
  }
  receivePort.close();
}

Future<void> main() async {
  final mainReceivePort = ReceivePort();

  // Spawn a new isolate
  await Isolate.spawn(isolateFunction, mainReceivePort.sendPort);

  // Get the send port from the isolate
  final SendPort isolateSendPort = await mainReceivePort.first;

  // Create another receive port for responses
  final responsePort = ReceivePort();

  // Send a message and receive port to the isolate
  isolateSendPort.send("Hello from main isolate");

  // Listen for the response
  responsePort.listen((message) {
    print("Main received: $message");
  },);

  // Close everything after some time
  await Future.delayed(Duration(seconds: 2));
  isolateSendPort.send('close');
  mainReceivePort.close();
  responsePort.close();
}

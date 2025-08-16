import 'dart:convert';
import 'dart:io';

const pathLong =
    '/Users/ishifr/Desktop/project/dart_up/oop/dart_apprentice_book/assets/text_long.txt';
const path =
    '/Users/ishifr/Desktop/project/dart_up/oop/dart_apprentice_book/assets/text.txt';

void main(List<String> args) async {
  fromFutures();
}

fromFutures() async {
  final first = Future(() => 'Row');
  final second = Future(() => 'row');
  final third = Future(() => 'row');
  final fourth = Future.delayed(Duration(milliseconds: 300), () => 'your boat');
  final stream = Stream<String>.fromFutures([first, second, third, fourth]);

  stream.listen(print);
}

// Exercise
task() async {
  var myStream = Stream<int>.periodic(
    Duration(seconds: 1),
    (computationCount) => computationCount,
  ).take(5);

  await for (final e in myStream) {
    print(e);
  }
}

decodingByteStream(String path) async {
  final file = File(path);
  final byteStream = file.openRead();
  final stringStream = byteStream.transform(utf8.decoder);
  await for (final data in stringStream) {
    print(data);
  }
}

readAsStreamWithLoop(String path) async {
  final file = File(path);
  final stream = file.openRead();
  await for (final chunk in stream) {
    print(chunk.length);
  }
}

readAsStream(String path) async {
  final file = File(path);
  final stream = file.openRead();
  stream.listen((chunk) {
    print("--------\n${chunk.length}");
  });
}

readAsString(String path) async {
  final file = File(path);
  final content = await file.readAsString();
  print(content);
}

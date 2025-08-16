// Adding a Task to the Event Queue
// Passing a block of code to Future causes Dart to put that
// code on the event queue rather than running it synchronously.

// void main(List<String> args) {
//   print("first");
//   Future(() => print("second"));
//   Future.microtask(() => print("third"));
//   print("four");
// }

// Challenge 1: What Order?
// In what order will Dart print the numbered statements? Why?

void main(List<String> args) {
  print("1 synchronous");
  Future(() => print("2 event queue")).then((value) => print("3 synchronous"));
  Future.microtask(() => print('4 microtask queue'));
  Future.microtask(() => print('5 microtask queue'));
  Future.delayed(Duration(seconds: 1), () => print("6 event queue"));
  Future(
    () => print('7 event queue'),
  ).then((value) => Future(() => print('8 event queue')));
  Future(
    () => print('9 event queue'),
  ).then((value) => Future.microtask(() => print('10 microtask queue')));
  print('11 synchronous');
}
// 1
// 11
// 4
// 5
// 2
// 3
// 7
// 9
// 10
// 8
// 6
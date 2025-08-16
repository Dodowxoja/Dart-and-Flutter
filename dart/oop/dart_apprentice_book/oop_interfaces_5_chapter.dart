// Interfaces are similar to abstract classes in that they
// let you define the behavior you expect for all classes that
// implement the interface. They’re a means of hiding the
// implementation details of the concrete classes from the rest
// of your code. Why is that important? To answer that question
// it’s helpful to understand a little about architecture.
// Not the Taj Mahal kind of architecture, software architecture.

// Note: Business logic, which is sometimes called business rules or
// domain logic, refers to the essence of what your app does. The
// business logic of a calculator app would be the mathematical calculations
// themselves. Those calculations don’t depend on what your UI looks
// like or how you store the answers.

// Here’s where interfaces come in. An interface is a description
// of how communication will be managed between two parties. A phone
// number is a type of interface. If you want to call your friend,
// you have to dial your friend’s phone number. Dialing a different
// number won’t work. Another word for interface is protocol, as in
// Internet Protocol (IP) or Hypertext Transfer Protocol (HTTP). Those
// protocols are the rules for how communication happens among the
// users of the protocol.

// When you create an interface in Dart, you define the rules for how
// one part of your codebase will communicate with another part. As long
// as both parts follow the interface rules, each part can change
// independently of the other. This makes your app much more manageable.
// In team settings, interfaces also allow different people to work on different
// parts of the codebase without worrying that they’re going to mess
// up someone else’s code.

// *Creating an Abstract Interface Class*
// Say you want to make a weather app, and your business logic needs to
// get the current temperature in some city. Since those are the requirements,
// your Dart interface class would look like this:

abstract class DataRepository {
  double? fetchTemperature(String city);

  factory DataRepository() =>
      FaceWebServer(); // you can make it look like it’s possible to instantiate the class now.
}

// -Note- that repository is a common term to call an interface that hides
// the details of how data is stored and retrieved. Also, the reason the
// result of fetchTemperature is nullable is that someone might ask for
// the temperature in a city that doesn’t exist.

// *Implementing the Interface*
// The Dart class above was just a normal abstract class, like the one
// you made earlier. However, when creating a concrete class to implement
// the interface, you use the implements keyword instead of the extends keyword.

class FaceWebServer implements DataRepository {
  @override
  double? fetchTemperature(String city) {
    return 42.0;
  }
}

// void main(List<String> args) {
//   final DataRepository repository = FaceWebServer();
//   final temperature = repository.fetchTemperature('Berlin');
//   // After adding fuctory constructor
//   final repository2 = DataRepository();
//   final temperature2 = repository2.fetchTemperature('Tashkent');
// }
// The implementation details are different for every platform,
// but you don’t have to worry about that because your code will
// only talk to the interface, not to the platform. Are you
// starting to see how powerful interfaces can be?

// *Extending vs Implementing*
// There are a couple of differences between extends and implements.
// Dart only allows you to extend a single superclass. This is known
// as single inheritance, which is in contrast with
// other languages that allow multiple inheritance

// So the following is not allowed in Dart:

// class MySubclass extends OneClass, AnotherClass{} // Not OK
// However, you can implement more than one interface:
// class MyClass implements OneClass, AnotherClass {} // OK
// You can also combine extends and implements :
// class MySubclass extends OneClass implements AnotherClass {} // OK

// But what’s the difference between just extending or implementing?
// That is, how are these two lines different:
// class SomeClass extends AnotherClass {}
// class SomeClass implements AnotherClass {}

// When you extend AnotherClass, SomeClass has access to any logic
// or variables in AnotherClass. However, if SomeClass implements
// AnotherClass, SomeClass must provide its own version of all
// methods and variables in AnotherClass .

// Example of Extending
// Assume AnotherClass looks like the following:
class AnotherClass {
  int myFriend = 42;
  void myMethod() => print(myFriend);
}

// You can extend it like this with no issue:
class SomeClass extends AnotherClass {}

// Example of Implementing
// Using implements in the same way doesn’t work:

// class OneClass implements AnotherClass {} // Not OK

// The implements keyword tells Dart that you only want the field types
// and method signatures. You’ll provide the concrete implementation
// details for everything yourself. How you implement it is up to you,
// as demonstrated in the following example:

class OneClass implements AnotherClass {
  @override
  int myFriend = 0;

  @override
  void myMethod() => print("Hello");
}
// Test that code again as before:

// void main(List<String> args) {
//   // Check that SomeClass objects have access to AnotherClass data and methods:
//   final someClass = SomeClass();
//   print(someClass.myFriend);
//   someClass.myMethod();
//   // This time you see your custom implementation results in 0 and Hello.
//   final oneClass = OneClass();
//   print(oneClass.myFriend);
//   oneClass.myMethod();
// }

// Challenge 1: Fizzy Bottles
// 1. Create an interface called Bottle and add a method to it called open.
// 2. Create a concrete class called SodaBottle that implements
// Bottle and prints “Fizz fizz” when open is called,
// 3. Add a factory constructor to Bottle that returns a SodaBottle instance.
// 4. Instantiate SodaBottle by using the Bottle factory
// constructor and call open on the object.

abstract class Bottle {
  void open();

  factory Bottle() => SodaBottle();
}

class SodaBottle implements Bottle {
  @override
  void open() => print("Fizz fizz");
}

// Challenge 2: Fake Notes
// Design an interface to sit between the business logic of your
// note-taking app and a SQL database. After that, implement
// a fake database class that will return mock data.

abstract class DataStorage {
  factory DataStorage() => FakeDatabase();
  String findNote(int id);
  List<String> allNotes();
  void saveNote(String note);
}

class FakeDatabase implements DataStorage {
  @override
  List<String> allNotes() => [
    "This is first note",
    "This is second note",
    "This is third note",
  ];

  @override
  String findNote(int id) => allNotes()[id];

  @override
  void saveNote(String note) => allNotes().add(note);
}

void main(List<String> args) {
  final sodaBottle = Bottle();
  sodaBottle.open();
  final database = DataStorage();
  final note = database.findNote(2);
  database.saveNote('Water the flowers.');
  final allNotes = database.allNotes();
  print(note);
  print(allNotes);
}

// Key Points

// One rule of clean architecture is to separate business logic from
// infrastructure logic like the UI, storage, third-party packages and the network.

// Interfaces define a protocol for code communication.

// Use the implements keyword to create an interface.

// Dart only allows single inheritance on its classes.

// * 4 Abstract Classes *

// The classes and subclasses you created previously were concrete classes.
// It’s not that they’re made of cement; it just means that you can make
// actual objects out of them. That’s in contrast to abstract classes,
// from which you can’t make objects

abstract class Animal {
  bool isAlive = true;
  void eat();
  void move();

  @override
  String toString() {
    return "I'm a $runtimeType";
  }
}
// Here are a few important points about that code:
// * The way you define an abstract class in Dart is to put the abstract
// keyword before class.

// * In addition to the class itself being abstract, Animal also has
// two abstract methods: eat and move. You know they’re abstract
// because they don’t have curly braces; they just end with a semicolon.

// * These abstract methods describe behavior that a subclass must
// implement. However, they don’t tell how to implement that behavior.
// That’s up to the subclass, which is a good thing. There are so many
// ways to eat and move throughout the animal kingdom that it would be
// almost impossible for Animal to specify anything meaningful here.

// * Note that just because a class is abstract doesn’t mean that it
// can’t have concrete methods or data. You can see that Animal has a
// concrete isAlive field, with a default value of true . Animal also
// has a concrete implementation of the toString method, which belongs
// to the Object superclass. The runtimeType property also comes from
// Object and gives the object type at runtime

// when you extend an abstract class, you must provide an implementation of any
// abstract methods, which in this case are *eat* and *move*.
class Platypus extends Animal {
  @override
  void eat() {
    print("Munch munch");
  }

  @override
  void move() {
    print("Glide glide");
  }

  void layEggs() {
    print("Plop plop");
  }
}
// * A concrete class has access to concrete data, like isAlive,
// from its abstract parent class.
// * Dart recognized that the runtime type was Platypus, even though
// runtimeType comes from Object and was accessed in the toString method of Animal

// void main(List<String> args) {
//   final platypus = Platypus();
//   print(platypus.isAlive);
//   platypus.eat();
//   platypus.move();
//   platypus.layEggs();
//   print(platypus);
// }

// *Challenge 1: Saving It Somewhere*

// 1. Create an abstract class named Storage with print statements
// in the save and retrieve methods
// 2. Extend Storage with concrete classes named LocalStorage and CloudStorage.

abstract class Storage {
  void save(String data) {
    print("Data storage not implemented");
  }

  String retrieve() {
    print("Data retrieval not implemented");
    return '';
  }
}

class LocalStorage extends Storage {
  String _data = '';
  @override
  void save(String data) {
    print("Saving $data in a local database...");
    _data = data;
  }

  @override
  String retrieve() {
    print("Retrieving data from the database...");
    return _data;
  }
}

class CloudStorage extends Storage {
  String _data = '';

  @override
  void save(String data) {
    print("Saving $data to cloud...");
    _data = data;
  }

  @override
  String retrieve() {
    print("Retrieving data from the cloud...");
    return _data;
  }
}

// void main(List<String> args) {
//   final database = LocalStorage();
//   database.save('42');
//   print(database.retrieve());

//   final cloud = CloudStorage();
//   cloud.save('24');
//   print(cloud.retrieve());
// }

// *Key Points*

// Abstract classes define class members and may or may not contain concrete logic.

// Abstract classes can’t be instantiated.

// Concrete classes can extend abstract classes.

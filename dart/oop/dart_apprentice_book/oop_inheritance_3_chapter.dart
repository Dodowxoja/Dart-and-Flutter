// 3 Inheritance

// In many situations, you’ll need to create a hierarchy of classes
// that share some base functionality. You can create your own
// hierarchies by *extending classes*. This is also called
// *inheritance* because the classes form a tree in which *child
// classes* inherit from *parent classes*. The parent and child classes
// are also called *superclasses* and *subclasses* respectively.
// The Object class is the top superclass for all non-nullable
// types in Dart. All other classes, except Null, are subclasses
// of Object.

// Note: Although there’s no named top type in Dart, since all
// non-nullable Dart types derive from the Object type and Object
// itself is a subtype of the nullable Object? type, Object? can be
// considered in practice to be the root of the type system.

enum Grade { A, B, C, D, F }

class Person {
  String givenName;
  String surname;
  String get fullName => '$givenName $surname';

  Person(this.givenName, this.surname);

  @override
  String toString() => fullName;
}

class Studentt {
  String givenName;
  String surname;
  var grades = <Grade>[]; // only difference
  String get fullName => '$givenName $surname';

  Studentt(this.givenName, this.surname);

  @override
  String toString() => fullName;
}

// Naturally, the Person and Studentt classes are very similar,
// since students are in fact persons. The only difference
// at the moment is that a Studentt will have a list of grades .

// Subclassing to Remove Code Duplication
// We can remove the duplication between Student and Person
// by making Student extend Person. We do so by adding extends
// Person after the class name and removing everything
// but the Student constructor and the grades list.

class Student extends Person {
  Student(String givenName, String surname) : super(givenName, surname);

  var grades = <Grade>[];
}

// In contrast to *this*, the *super* keyword is used to refer
// one level up the hierarchy. Similar to the forwarding
// constructor that “Classes”, using *super(givenName,surname)*
// passes the constructor parameters on to another constructor.
// However, since you’re using super instead of this, you’re
// forwarding the parameters to the parent class’s constructor,
// that is, to the constructor of Person

class SchoolBandMember extends Student {
  SchoolBandMember(super.givenName, super.surname);

  static const minimumPracticeTime = 2;
}

class StudentAthlete extends Student {
  StudentAthlete(super.givenName, super.surname);

  bool get isEligible => grades.every((grade) => grade != Grade.F);
}

// void main() {
//   final jon = Person('Jon', 'Snow');
//   final jane = Student('Jane', 'Snow');

//   final historyGrade = Grade.B;
//   jane.grades.add(historyGrade);

//   print(jon.fullName);
//   print(jane.fullName);

//   final jessie = SchoolBandMember('Jessie', 'Jones');
//   final marty = StudentAthlete('Marty', 'McFly');
// }

// Visualizing the Hierarchy
// Here’s what your class hierarchy looks like now:
//                      Object
//                         |
//                      Person
//                         |
// SchoolBandMember <-- Student --> StudentAthlete

// You see that SchoolBandMember and StudentAthlete are both
// students, and all students are also persons.

// Type Inference in a Mixed List
// Since Jane, Jessie and Marty are all students,
// you can put them into a list.

// Having an object be able to take multiple forms is known as
// polymorphism. This is a key part of object-oriented programming.

// Challenge 1: Fruity Colors
// 1. Create a class named Fruit with a String field named color and
// a method named describeColor , which uses color to print a message.
class Fruit {
  final String color;

  Fruit(this.color);

  void describeColor() {
    print("Color of fruit: $color");
  }
}

// 2. Create a subclass of Fruit named Melon and then create two Melon
// subclasses named Watermelon and Cantaloupe.

class Melon extends Fruit {
  Melon(super.color);
}

class Watermelon extends Melon {
  Watermelon(super.color);

  // 3. Override describeColor in the Watermelon class to vary the output.
  @override
  void describeColor() {
    // super.describeColor();
    print("Here is $color Watermelon");
  }
}

class Cantaloupe extends Melon {
  Cantaloupe(super.color);
}

// Challenge 2: Composition Over Inheritance
// 1. Create a Person class.
// 2. Create a Student class that inherits from Person.
// 3. Give the Student class a list of roles, including athlete, band
// member and student union member. You can use an enum for the roles.
// 4. Create some Student objects and give them various roles.
enum Roles { Athlete, BandMember, StudentUnionMember }

class Person2 {
  final String name;
  final String surname;

  Person2(this.name, this.surname);

  @override
  String toString() => "$name $surname";
}

class Student2 extends Person2 {
  List<Roles> roles = [];
  Student2(super.name, super.surname);
}

// void main() {
//   // Challenge 1
//   final melon = Watermelon('red');
//   melon.describeColor();

//   // Challenge 2
//   final student = Student2("Jone", "Lopez");
//   student.roles.addAll([Roles.Athlete, Roles.StudentUnionMember]);
//   print(student.toString());
// }

// *Key Points*

// A subclass has access to the data and methods of its parent class.

// You can create a subclass of another class by using the extends keyword.

// A subclass can override its parent’s methods or properties to provide custom behavior.

// Prefer adding behaviors to a class over inheriting behavior from a parent

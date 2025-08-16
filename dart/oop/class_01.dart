// Dart is an object-oriented language with classes and mixin-based inheritance.
// Every object is an instance of a class, and all classes except Null descend(go down)
// from Object. Mixin-based inheritance means that although every class
// (except for the top class, Object?) has exactly one superclass, a class body
// can be reused in multiple class hierarchies. Extension methods are a way to
// add functionality to a class without changing the class or creating a subclass.

// Using class members 
// Objects have members consisting of functions and data (methods and vaiables, respectively).
// When you call a method, you invoke it on an object.

// Here is simple class definition
// Instance variables. Here's how you declare instance variables:
class Point {
  int? x;    // Declare instance variable x, initially null.
  int? y;    // Declare y, initially null.
  int z = 7; // Declare z, initially 7.
}
// An uninitialized instance variable declared with a nullable type has the value null.
// Non-nullable instance variables must be initialized at declaration.

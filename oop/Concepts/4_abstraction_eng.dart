//? 4. Abstraction:
// Abstraction involves hiding the complex implementation details and
// showing only the essential features of an object. Abstract classes and
// interfaces are used to achieve abstraction in Dart.

// Example:
abstract class Shape {
  void draw(); // Abstract method (no implementation)
}

class Circle extends Shape {
  void draw() {
    print('Drawing a circle');
  }
}

void main() {
  Circle myCircle = Circle();
  myCircle.draw(); // Calls Circle's draw method
}

// In this example, Shape is an abstract class with an abstract method draw.
// Concrete classes like Circle must provide an implementation for the abstract method.

// These examples cover the fundamental OOP concepts in Dart.
// Understanding these principles is essential for effective object-oriented
// programming and design.
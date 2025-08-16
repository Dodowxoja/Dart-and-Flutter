//? 2. Inheritance:
// Inheritance is a mechanism where a new class inherits properties and
// behaviors from an existing class. The existing class is called the superclass,
// and the new class is the subclass.

// Example:
class Animal {
  void speak() {
    print('Animal speaks');
  }
}

class Dog extends Animal {
  void bark() {
    print('Dog barks');
  }
}

void main() {
  Dog myDog = Dog();
  myDog.speak(); // Inherited from Animal
  myDog.bark(); // Dog-specific behavior
}

// In this example, Dog inherits from Animal . The speak method is inherited,
// and Dog adds its own behavior with the bark method.
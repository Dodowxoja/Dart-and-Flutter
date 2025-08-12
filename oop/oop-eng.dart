//! What is OOPS in Dart ?

// Object-oriented programming (OOP) is a way of writing computer programs.
// Instead of just writing lines of code, we organize our code around things called “objects.”
// These objects can be anything, like a person, a bank account, or a car.

// Each object has its own special features (we call them “attributes”) and
// things it can do (we call them “behavior”). For example, if our object is a
// person, they might have features like a name, age, and height, and they can
// do things like walking and talking.

// OOP is like a way of thinking where we model our code after the real world,
// making it easier to understand and manage. It’s used in many programming
// languages like Dart, Java, C++, and Python.

// Absolutely, let’s break down the concepts of class and object in
// Object-Oriented Programming (OOP) using simple language with an example:

//? Class:
// A class is like a blueprint or a recipe. It helps us create something. Think of it
// like a plan for making cookies. The plan tells us what ingredients to use and
// what steps to follow.

//? Object:
// An object is the actual thing we create using the class, similar to baking cookies following the recipe. Each cookie (object) made using the recipe (class) might look the same, but they can have different flavors or toppings (attributes).

//? Example:

// Let’s say we want to represent a simple thing like a “Dog” in our program.

// Class definition
class Dog {
// Attributes (properties) of the Dog
  late String name;
  late int age;
  late String breed;

// Method (behavior) of the Dog
  void bark() {
    print('Woof! Woof!');
  }
}

void main() {
// Creating an object (instance) of the Dog class
  Dog myDog = Dog();

// Setting attributes for the dog
  myDog.name = 'Buddy';
  myDog.age = 3;
  myDog.breed = 'Golden Retriever';

// Using the object's method
  myDog.bark();

// Outputting some information about the dog
  print('${myDog.name} is a ${myDog.age}-year-old ${myDog.breed}.');

// Creating another dog
  Dog anotherDog = Dog();
  anotherDog.name = 'Max';
  anotherDog.age = 2;
  anotherDog.breed = 'Labrador';

// Using the method of the second dog
  anotherDog.bark();

// Outputting information about the second dog
  print(
      '${anotherDog.name} is a ${anotherDog.age}-year-old ${anotherDog.breed}.');
}

// In this example:

// - `Dog` is the class: It's like the recipe for creating a dog.
// - `myDog` and `anotherDog` are objects: These are like actual dogs created
// using the `Dog` class. They have attributes (name, age, breed) and can
// perform actions (bark).

// So, a class is the plan, and objects are what we create based on that plan. It's
// a way to organize and manage our code by thinking about things in the real world.

// Four Concepts of OOPS
// 1. Encapsulation
// 2. Inheritance
// 3. Polymorphism
// 4. Abstraction
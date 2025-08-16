// *Mixins*

// Problems With Extending and Implementing
// Think back to the Animal examples again. Say you’ve got
// a bunch of birds, so you’re carefully planning an abstract
// class to represent them. Here’s what you come up with:

import 'oop_abstract_4_chapter.dart';

abstract class Bird {
  void fly();
  void layEggs();
}

// “It’s looking good!” you think. “I’m getting the hang of this.”
// So you try it out on Robin :
class Robin extends Bird {
  @override
  void fly() {
    print("Swoosh swoosh");
  }

  @override
  void layEggs() {
    print("Plop plop");
  }
}
// “Perfect!” You smile contentedly at your handiwork.
// Then you hear a sound behind you.
// “Munch, munch. Glide, glide. Plop, plop. I’m a platypus.”
// Oh. Right. The platypus.

//  Mixing in Code

// To make a mixin, you take whatever concrete code you want
// to share with different classes, and package it in its
// own special mixin class.

// Write the following two mixins:

mixin EggLayer {
  void layEggs() {
    print("Plop plop");
  }
}

mixin Flyer {
  void fly() {
    print("Swoosh swoosh");
  }
}

// The mixin keyword indicates that these classes can only
// be used as mixins. You can also use a normal class as
// a mixin as long as that class doesn’t extend another non- Object
// class. So if you wanted to use EggLayer as a normal class,
// then just replace the mixin keyword with class or abstract class .
class RobinMixin extends Bird with EggLayer, Flyer {}

// There are two mixins, so you separate them with a comma.
// Since those two mixins contain
// all the code that Bird needs, the class body is now empty.

class Platypus extends Animal with EggLayer {
  @override
  void eat() {
    print("Munch munch");
  }

  @override
  void move() {
    print("Glide glide");
  }
}
// The layEggs logic has moved to the mixin. Now both Robin and
// Platypus share the code that the EggLayer mixin contains.
// Just to make sure it works, run the following code:

// void main(List<String> args) {
//   final platypus = Platypus();
//   final robin = RobinMixin();
//   platypus.layEggs();
//   robin.layEggs();
// }

// Challenges
// Challenge 1: Calculator
// 1. Create a class called Calculator with a method called sum
// that prints the sum of any two integers you give it.

class Calculator {
  void sum(int a, int b) {
    print("Sum of a and b is ${a + b}");
  }
}

// 2. Extract the logic in sum to a mixin called Adder.
mixin Adder {
  void sum(int a, int b) {
    print("Sum of a and b is ${a + b}");
  }
}

// 3. Use the mixin in Calculator.

class CalculatorMixin with Adder {}

// Challenge 2: Heavy Monotremes
// Dart has a class named Comparable , which is used by the sort
// method of List to sort its elements.

// 1. Add a weight field to the Platypus class you made earlier.

// 2. Then make Platypus implement Comparable so that when you have
// a list of Platypus objects, calling sort on the list will sort
// them by weight.
class PlatypusCH extends Animal
    with EggLayer
    implements Comparable<PlatypusCH> {
  double weight;

  PlatypusCH(this.weight);
  @override
  void eat() {
    print("Munch munch");
  }

  @override
  void move() {
    print("Glide glide");
  }

  @override
  int compareTo(PlatypusCH other) {
    if (weight > other.weight) {
      return 1;
    } else if (weight < other.weight) {
      return -1;
    }
    return 0;
  }
}

void main(List<String> args) {
  var calc = CalculatorMixin();
  final willi = PlatypusCH(1.0);
  final billi = PlatypusCH(2.4);
  final nilli = PlatypusCH(2.1);
  final jilli = PlatypusCH(0.4);
  final silli = PlatypusCH(1.7);
  final platypi = [willi, billi, nilli, jilli, silli];

  calc.sum(12, 2);

  for (final platypus in platypi) {
    print(platypus.weight);
  }
  print('---');

  platypi.sort();
  for (final platypus in platypi) {
    print(platypus.weight);
  }
}

// Key Points

// Mixins allow you to share code between classes.

// You can use any class as a mixin as long as it 
// doesn’t extend anything besides Object

// Using the mixin keyword means that a class can only be used as a mixin.
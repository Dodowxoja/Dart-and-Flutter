// Liskov Substitution Principle
// Subtypes must be substitutable for their base types

abstract class Animal {
  void move();
}

abstract class FlyingAnimal extends Animal {
  void fly() {
    print('Flying...');
  }

  @override
  void move() {
    fly();
  }
}

abstract class WalkingAnimal extends Animal {
  void walk() {
    print('Walking...');
  }

  @override
  void move() {
    walk();
  }
}

class Sparrow extends FlyingAnimal {}

class Penguin extends WalkingAnimal {}

void main() {
  // Good example usage
  Animal sparrow = Sparrow();
  Animal penguin = Penguin();

  // Both of these are safe and follow LSP
  sparrow.move(); // Will fly
  penguin.move(); // Will walk

  // We can also have a list of animals and treat them polymorphically
  List<Animal> animals = [Sparrow(), Penguin()];
  for (var animal in animals) {
    animal.move(); // Each animal moves according to its capability
  }
}

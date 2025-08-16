// Interface Segregation Principle
// Clients should not be forced to depend on interfaces they do not use

// Bad Example - Fat interface
abstract class WorkerBad {
  void work();
  void eat();
  void sleep();
}

class HumanWorker implements WorkerBad {
  @override
  void work() {
    print('Working...');
  }

  @override
  void eat() {
    print('Eating...');
  }

  @override
  void sleep() {
    print('Sleeping...');
  }
}

class RobotWorker implements WorkerBad {
  @override
  void work() {
    print('Working efficiently...');
  }

  @override
  void eat() {
    // Robots don't eat, but forced to implement
    throw UnimplementedError('Robots don\'t eat');
  }

  @override
  void sleep() {
    // Robots don't sleep, but forced to implement
    throw UnimplementedError('Robots don\'t sleep');
  }
}

// Good Example - Segregated interfaces
abstract class Workable {
  void work();
}

abstract class Eatable {
  void eat();
}

abstract class Sleepable {
  void sleep();
}

// Human implements all interfaces
class Human implements Workable, Eatable, Sleepable {
  @override
  void work() {
    print('Working...');
  }

  @override
  void eat() {
    print('Eating...');
  }

  @override
  void sleep() {
    print('Sleeping...');
  }
}

// Robot only implements what it needs
class Robot implements Workable {
  @override
  void work() {
    print('Working efficiently...');
  }
}

void main() {
  // Using the good example
  final human = Human();
  final robot = Robot();

  // Both can work
  human.work();
  robot.work();

  // Only human can eat and sleep
  human.eat();
  human.sleep();

  // No need to implement unnecessary methods for Robot
  // robot.eat();  // This would cause an error
  // robot.sleep(); // This would cause an error
}

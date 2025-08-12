//? 3. Polymorphism:
// Polymorphism is like having a magic word that lets one thing act in many
// ways. In Dart, it means using the same name for something, but it can do
// different things based on what it is.

// Superclass
class Animal {
  void makeSound() {
    print('Some generic sound');
  }
}

// Subclass 1
class Dog extends Animal {
  @override
  void makeSound() {
    print('Woof! Woof!');
  }
}

// Subclass 2
class Cat extends Animal {
  @override
  void makeSound() {
    print('Meow!');
  }
}

void main() {
// Polymorphism in action
  Animal myDog = Dog();
  Animal myCat = Cat();

  myDog.makeSound(); // Output: Woof! Woof!
  myCat.makeSound(); // Output: Meow!
}

// Simple Explanation:
// Imagine you have a magic wand, and when you say makeSound,it produces
// different sounds based on what you point it at. That's what happens with
// polymorphism in Dart. You have different things (like a Dog or a Cat), but
// when you tell them to make a sound, they each make their own unique sound.

// Run-Time Polymorphism:
// In Dart, this magic happens when the program is running. It decides which
// specific sound to make based on the actual thing (object) it's dealing with.

// In short, polymorphism allows you to use the same name for something, but
// it behaves differently based on what it really is. In the example, both myDog
// and myCat are animals, but when you ask them to make a sound, they do it
// in their own way. That's the magic of polymorphism!
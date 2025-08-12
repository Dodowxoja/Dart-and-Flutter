//? 2. Meros olish (Inheritance):
// Meros olish — bu yangi class (sinflar) mavjud classdagi xususiyat va
// xatti-harakatlarni meros qilib oladigan mexanizm.
// Mavjud class — bu ota class (superclass),
// yangi class esa — farzand class (subclass) deb ataladi.

// Misol:
class Animal {
  void speak() {
    print('Hayvon ovoz chiqaryapti');
  }
}

class Dog extends Animal {
  void bark() {
    print('It vovillayapti');
  }
}

void main() {
  Dog myDog = Dog();
  myDog.speak(); // Animal classidan meros olingan metod
  myDog.bark(); // Itga xos bo‘lgan metod
}

// Ushbu misolda `Dog` classi `Animal` classidan meros oladi.
// `speak` metodi `Animal` classidan kelgan,
// `Dog` esa o‘ziga xos `bark` metodini qo‘shgan.

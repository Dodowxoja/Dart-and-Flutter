//? 3. Polimorfizm (Polymorphism):
// Polimorfizm — bu go‘yo sehrli so‘zga o‘xshaydi: bitta buyruq turli xil narsalar
// uchun turlicha ishlashi mumkin.
// Dart tilida bu bir xil nomdan foydalanib, ammo obyekt turiga qarab turli xil
// ish bajarishi demakdir.

// Ota class (Superclass)
class Animal {
  void makeSound() {
    print('Umumiy bir ovoz');
  }
}

// Farzand class 1
class Dog extends Animal {
  @override
  void makeSound() {
    print('Vov! Vov!');
  }
}

// Farzand class 2
class Cat extends Animal {
  @override
  void makeSound() {
    print('Miyov!');
  }
}

void main() {
  // Polimorfizm amalda
  Animal myDog = Dog();
  Animal myCat = Cat();

  myDog.makeSound(); // Natija: Vov! Vov!
  myCat.makeSound(); // Natija: Miyov!
}

// Oddiy tushuntirish:
// Tasavvur qiling, sizda sehrli tayoq bor, va `makeSound` deb aytsangiz,
// u tayoq qaysi narsaga qaratsa, o‘sha narsaning ovozini chiqaradi.
// Xuddi polimorfizmda bo‘lgani kabi: turli obyektlar (masalan, It va Mushuk)
// bir xil metodga ega (`makeSound`), ammo uni chaqirganda har biri o‘ziga
// xos ovoz chiqaradi.

// Ish vaqtida polimorfizm (Run-Time Polymorphism):
// Dart tilida bu “sehr” dastur ishlayotgan paytda yuz beradi.
// Ya’ni, dastur qaysi obyekt bilan ishlayotganini aniqlab,
// o‘sha obyektga mos metodni bajaradi.

// Xulosa:
// Polimorfizm bir xil nomli metod turli obyektlarda turlicha ishlashiga imkon beradi.
// Misolda, `myDog` ham, `myCat` ham hayvon, ammo ular ovoz chiqarganda
// har biri o‘ziga xos ovozni chiqaradi.
// Bu — polimorfizmning sehridir!
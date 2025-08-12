//? 4. Abstraksiya (Abstraction):
// Abstraksiya — bu murakkab ichki ishlash jarayonini yashirib,
// faqat obyektning muhim xususiyatlarini ko‘rsatishdir.
// Dart tilida abstraksiya abstrakt classlar va interfeyslar yordamida amalga oshiriladi.

// Misol:
abstract class Shape {
  void draw(); // Abstrakt metod (ichki kod yozilmagan)
}

class Circle extends Shape {
  @override
  void draw() {
    print('Aylana chizilmoqda');
  }
}

void main() {
  Circle myCircle = Circle();
  myCircle.draw(); // Circle classidagi draw metodini chaqiradi
}

// Ushbu misolda `Shape` abstrakt class bo‘lib, unda `draw` nomli abstrakt metod mavjud.
// Abstrakt metodning o‘zida kod yozilmagan, faqat nomi bor.
// `Circle` kabi aniq (concrete) classlar bu metodning ichki kodini yozishi shart.

// Ushbu 4 ta misol Dart tilidagi OOP (Obyektga yo‘naltirilgan dasturlash)
// ning asosiy prinsiplarini qamrab oladi:
// 1. Inkapsulyatsiya (Encapsulation)
// 2. Meros olish (Inheritance)
// 3. Polimorfizm (Polymorphism)
// 4. Abstraksiya (Abstraction)
//
// Bu prinsiplarni tushunish — samarali obyektga yo‘naltirilgan dasturlash
// va dastur tuzilmasini loyihalash uchun juda muhim.

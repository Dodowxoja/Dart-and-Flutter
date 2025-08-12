//! Dart tilida OOP nima?

// Obyektga yo‘naltirilgan dasturlash (OOP) — bu dasturlarni yozish usuli.
// Oddiygina kod yozish o‘rniga, biz kodni “obyekt” deb ataladigan narsalar
// atrofida tashkil qilamiz.
// Bu obyektlar istalgan narsa bo‘lishi mumkin: odam, bank hisobi yoki avtomobil.

// Har bir obyektning o‘ziga xos xususiyatlari (bularni “atribut” deb ataymiz) va
// bajaradigan ishlari (bularni “xatti-harakat” deb ataymiz) bo‘ladi.
// Masalan, agar obyektimiz “odam” bo‘lsa, uning nomi, yoshi va bo‘yi kabi
// xususiyatlari bo‘lishi mumkin, hamda yurish yoki gapirish kabi ishlarni
// bajara oladi.

// OOP — bu dasturlashni real hayotdagi narsalarga o‘xshatib modellashtirish
// usuli bo‘lib, kodni tushunishni va boshqarishni osonlashtiradi.
// Bu usul Dart, Java, C++ va Python kabi ko‘plab dasturlash tillarida ishlatiladi.

// Endi, OOP dagi “class” va “object” tushunchalarini oddiy tilda, misol bilan
// tushuntiramiz:

//? Class:
// Class — bu chizma yoki retseptga o‘xshaydi. Bu bizga nimanidir yaratishda yordam beradi.
// Xuddi pechene retsepti kabi, unda qaysi masalliqlar ishlatilishi va qanday qadamlar bajarilishi
// yozilgan bo‘ladi.

//? Object:
// Object — bu classdan foydalanib yaratilgan haqiqiy narsa, xuddi retseptga ko‘ra pishirilgan
// pechene kabi. Har bir pechene (obyekt) bir xil retsept (class) asosida tayyorlansa ham,
// ular turli ta’m yoki bezaklarga (atributlarga) ega bo‘lishi mumkin.

//? Misol:

// “It” degan oddiy narsani dasturimizda ifodalashni istaymiz:

// Class ta’rifi
class Dog {
  // Itning atributlari (xususiyatlari)
  late String name;
  late int age;
  late String breed;

  // Itning metodlari (xatti-harakati)
  void bark() {
    print('Vov! Vov!');
  }
}

void main() {
  // Dog classidan obyekt (instance) yaratish
  Dog myDog = Dog();

  // Itning atributlarini belgilash
  myDog.name = 'Buddy';
  myDog.age = 3;
  myDog.breed = 'Golden Retriever';

  // Obyekt metodidan foydalanish
  myDog.bark();

  // It haqida ma’lumot chiqarish
  print('${myDog.name} ${myDog.age} yoshda va zotli ${myDog.breed}.');

  // Yana bir it yaratish
  Dog anotherDog = Dog();
  anotherDog.name = 'Max';
  anotherDog.age = 2;
  anotherDog.breed = 'Labrador';

  // Ikkinchi itning metodidan foydalanish
  anotherDog.bark();

  // Ikkinchi it haqida ma’lumot chiqarish
  print(
      '${anotherDog.name} ${anotherDog.age} yoshda va zotli ${anotherDog.breed}.');
}

// Ushbu misolda:

// - `Dog` — bu class: It yaratish uchun “retsept” yoki “reja”.
// - `myDog` va `anotherDog` — bu obyektlar: `Dog` classidan yaratilgan haqiqiy itlar.
//   Ularning atributlari (name, age, breed) bor va ular biror ish bajaradi (bark).

// Demak, class — bu reja, obyekt — esa shu rejaga asoslanib yaratilgan narsa.
// Bu kodni real hayotdagi narsalar asosida tartibga solish va boshqarish usuli.

// OOP ning 4 asosiy tushunchasi:
// 1. Inkapsulyatsiya (Encapsulation)
// 2. Meros olish (Inheritance)
// 3. Polimorfizm (Polymorphism)
// 4. Abstraksiya (Abstraction)
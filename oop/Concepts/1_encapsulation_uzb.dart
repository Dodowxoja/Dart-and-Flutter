//? 1. Inkapsulyatsiya (Encapsulation) nima?
// Inkapsulyatsiya — bu narsalaringizni qutiga solib qo'yish kabi.
// Bu narsalarni bir joyda saqlashga va boshqalarning ularga aralashmasligiga yordam beradi.
// Dart tilida bu ma’lumotlarning bir qismini yashirish, ya’ni tashqi koddan bevosita
// o'zgartirishni qiyinlashtirish degani.

//? Nega inkapsulyatsiya ishlatiladi?
// Tasavvur qiling, sizda maxsus o'yinchoqlar qutisi bor.
// Siz boshqalarning o'yinchoqlaringiz bilan bevosita o'ynashlarini xohlamaysiz,
// ular sizdan ruxsat so'rashi kerak.
// Inkapsulyatsiya narsalaringizni himoya qiladi va kim ularga kira olishini boshqaradi.

// Dart misoli:
class BankAccount {
  // Xususiy maydonlar (inkapsulyatsiya qilingan)
  String _owner; // Egasi
  double _balance; // Balans

  // Konstruktor
  BankAccount(this._owner, this._balance);

  // Balans uchun ommaviy getter
  double get balance => _balance;

  // Egasi uchun ommaviy getter
  String get owner => _owner;

  // Pul qo'yish uchun ommaviy metod
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Hisobga: \$$amount qo'shildi. Yangi balans: \$_balance");
    } else {
      print("Qo'yiladigan summa musbat bo'lishi kerak.");
    }
  }

  // Pul yechish uchun ommaviy metod
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print("Hisobdan: \$$amount yechildi. Yangi balans: \$_balance");
    } else {
      print("Pul yechish summasi noto'g'ri.");
    }
  }
}

// Foydalanish misoli
void main() {
  var account = BankAccount("Alisa", 100.0);

  print("Egasining ismi: ${account.owner}"); // ✅ Ruxsat: getter orqali
  print("Balans: \$${account.balance}"); // ✅ Ruxsat: getter orqali

  account.deposit(50); // ➕ 50$ qo'shish
  account.withdraw(30); // ➖ 30$ yechish

  // ❌ Xususiy maydonlarga to'g'ridan-to'g'ri murojaat qilib bo'lmaydi:
  // account._balance = 1000000;  // Xato!
  // account._owner = "Xaker";    // Xato!
}


// Ushbu misolda `_owner, _balance` o'zgaruvchisi xususiy bo'lib,
// unga faqat getter va setter metodlari orqali kirish mumkin.
// Bu esa ma’lumotni himoyalash va boshqarishga imkon beradi.
//? 1. What is Encapsulation?
// Encapsulation is like putting your things in a box. It helps keep everything
// together and stops others from messing with your stuff. In Dart, it means
// hiding some information so that it's not easy for anyone outside to mess with it.

//? Why do we use Encapsulation?
// Imagine you have a special toy box. You don't want others to play with your
// toys directly; they should ask you nicely. Encapsulation is like protecting
// your things and controlling who can access them.

// Example in Dart:
class BankAccount {
  // Private fields (encapsulated)
  String _owner;
  double _balance;

  // Constructor
  BankAccount(this._owner, this._balance);

  // Public getter for balance
  double get balance => _balance;

  // Public getter for owner
  String get owner => _owner;

  // Public method to deposit money
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Deposited: \$amount. New balance: \$_balance");
    } else {
      print("Deposit amount must be positive.");
    }
  }

  // Public method to withdraw money
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print("Withdrawn: \$amount. New balance: \$_balance");
    } else {
      print("Invalid withdrawal amount.");
    }
  }
}

// Usage Example
void main() {
  var account = BankAccount("Alice", 100.0);

  print("Owner: ${account.owner}"); // ✅ Allowed: via getter
  print("Balance: \$${account.balance}"); // ✅ Allowed: via getter

  account.deposit(50); // ➕ Deposits \$50
  account.withdraw(30); // ➖ Withdraws \$30

  // ❌ Cannot access private fields directly:
  // account._balance = 1000000;  // Error!
  // account._owner = "Hacker";   // Error!
}

// In this example, the _owner, _balance variable is private, and access to it is controlled
// by getter and setter methods.
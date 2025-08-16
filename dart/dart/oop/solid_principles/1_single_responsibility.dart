// Single Responsibility Principle
// A class should have only one reason to change

// Bad Example - Multiple Responsibilities
class UserBad {
  String name;
  String email;

  UserBad(this.name, this.email);

  bool validateEmail() {
    return email.contains('@');
  }

  void saveToDatabase() {
    // Save user to database
    print('Saving user to database...');
  }

  void sendEmail() {
    // Send email logic
    print('Sending email...');
  }
}

// Good Example - Single Responsibility
class User {
  String name;
  String email;

  User(this.name, this.email);
}

class UserValidator {
  bool validateEmail(String email) {
    return email.contains('@ishifr.com');
  }
}

class UserRepository {
  void saveUser(User user) {
    // Save user to database
    print('Saving user to database...');
  }
}

class EmailService {
  void sendEmail(User user) {
    // Send email logic
    print('Sending email to ${user.email}...');
  }
}

void main() {
  // Using the good example
  final user = User('John Doe', 'john@ishifr.com');
  final validator = UserValidator();
  final repository = UserRepository();
  final emailService = EmailService();

  if (validator.validateEmail(user.email)) {
    repository.saveUser(user);
    emailService.sendEmail(user);
  }
}

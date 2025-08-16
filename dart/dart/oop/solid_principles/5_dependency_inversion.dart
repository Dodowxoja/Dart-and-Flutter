// Dependency Inversion Principle
// High-level modules should not depend on low-level modules.
// Both should depend on abstractions.

// Bad Example
class EmailNotifier {
  void sendEmail(String message) {
    print('Sending email: $message');
  }
}

class NotificationServiceBad {
  final EmailNotifier emailSender = EmailNotifier();

  void sendNotification(String message) {
    emailSender.sendEmail(message);
  }
}

// Good Example
// First, define an abstraction
abstract class MessageSender {
  void sendMessage(String message);
}

// Low-level modules implement the abstraction
class EmailMessageSender implements MessageSender {
  @override
  void sendMessage(String message) {
    print('Sending email: $message');
  }
}

class SMSMessageSender implements MessageSender {
  @override
  void sendMessage(String message) {
    print('Sending SMS: $message');
  }
}

class SlackMessageSender implements MessageSender {
  @override
  void sendMessage(String message) {
    print('Sending Slack message: $message');
  }
}

// High-level module depends on abstraction
class NotificationService {
  final MessageSender messageSender;

  NotificationService(this.messageSender);

  void sendNotification(String message) {
    messageSender.sendMessage(message);
  }
}

void main() {
  // We can easily switch between different implementations
  final emailNotification = NotificationService(EmailMessageSender());
  final smsNotification = NotificationService(SMSMessageSender());
  final slackNotification = NotificationService(SlackMessageSender());

  // Send notifications through different channels
  emailNotification.sendNotification('Hello via email');
  smsNotification.sendNotification('Hello via SMS');
  slackNotification.sendNotification('Hello via Slack');

  // Easy to add new message sending methods without changing NotificationService
}

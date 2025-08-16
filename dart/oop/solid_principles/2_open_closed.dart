// Open/Closed Principle
// Software entities should be open for extension but closed for modification

// Bad Example
class DiscountCalculatorBad {
  double calculateDiscount(String customerType, double price) {
    if (customerType == 'regular') {
      return price * 0.1;
    } else if (customerType == 'premium') {
      return price * 0.2;
    } else if (customerType == 'vip') {
      return price * 0.3;
    }
    return 0;
  }
}

// Good Example
abstract class DiscountStrategy {
  double calculateDiscount(double price);
}

class RegularCustomerDiscount implements DiscountStrategy {
  @override
  double calculateDiscount(double price) {
    return price * 0.1;
  }
}

class PremiumCustomerDiscount implements DiscountStrategy {
  @override
  double calculateDiscount(double price) {
    return price * 0.2;
  }
}

class VIPCustomerDiscount implements DiscountStrategy {
  @override
  double calculateDiscount(double price) {
    return price * 0.3;
  }
}

class DiscountCalculator {
  final DiscountStrategy strategy;

  DiscountCalculator(this.strategy);

  double calculateDiscount(double price) {
    return strategy.calculateDiscount(price);
  }
}

void main() {
  final price = 100.0;
  
  // Calculate discount for different customer types
  final regularCalc = DiscountCalculator(RegularCustomerDiscount());
  final premiumCalc = DiscountCalculator(PremiumCustomerDiscount());
  final vipCalc = DiscountCalculator(VIPCustomerDiscount());

  print('Regular customer discount: ${regularCalc.calculateDiscount(price)}');
  print('Premium customer discount: ${premiumCalc.calculateDiscount(price)}');
  print('VIP customer discount: ${vipCalc.calculateDiscount(price)}');
}

// Encapsulation
// What: Protect internal data, expose only what’s needed.
// Why: Prevent invalid states, enforce rules.
// How: Use private variables (_variable) and public methods/getters.

// 1. What is Encapsulation?
// Goal: Protect an object’s internal state from unintended modification.
// Mechanism: Hide data (variables) and expose behavior (methods).
// Key Dart Syntax: Use _ (underscore) to make variables/methods
// private (visible only within the same library/file).

// 2. Why Encapsulation Matters
// Control: Validate data before it’s modified (e.g., prevent negative bank balances).
// Flexibility: Change internal logic without breaking external code.
// Safety: Prevent external code from bypassing business rules.




class Temperature{
  double _celsius = 0; // Hidden

  // Public getter (read-only access)
  double get celsius => _celsius;

  // Public setter with validation
  void set setCelsius(double value){
    if(value >= -273.15)_celsius = value;
  }
}

void main(List<String> args) {
 var temp = Temperature();
 print(temp.celsius); 
 temp.setCelsius = 77.7;
 print(temp.celsius); 
}


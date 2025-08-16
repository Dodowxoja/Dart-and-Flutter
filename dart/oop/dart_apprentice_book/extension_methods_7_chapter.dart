// 7 Extension Methods

// However, Dart has a feature called extension methods that
// allows you to add functionality to existing classes. Even
// though they’re called extension methods, you can also add
// other members like getters, setters or even operators.

// Extension Syntax
// To make an extension, you use the following syntax:

extension on Object {
  // your code
}

// This should be located at the top level in a file, that is,
// not inside another class or function. Replace
// Object with whatever class you want to add extra functionality to.

// You may give the extension itself a name if you like.
// In that case, the syntax is as follows:

extension MyExtensionName on Object {
  // your custom code
}

// String Extension Example
// Did you ever make secret codes when you were a kid, like a=1,
// b=2 , c=3 , and so on? For this example, you’re going to make
// an extension that will convert a string into a secret coded message.
// Then you’ll add another extension method to decode it.
// In this secret code, each letter will be bumped up to the next one.
// So a will be b, b will be c, and so on. To accomplish that, you’ll
// increase the Unicode value of each code point in the input string by
// 1. If the original message were “abc”, the encoded message should be “bcd”.

// Solving in the Normal Way
// First, solve the problem as you would with a normal function.
// Add the following to your project:

String encode(String input) {
  final output = StringBuffer();
  for (final codePoint in input.runes) {
    output.writeCharCode(codePoint + 1);
  }
  return output.toString();
}

// Converting to an Extension
// Since this extension won’t mutate the original string itself,
// a naming convention is to use an adjective rather than a commanding
// verb. That’s the reason for choosing encoded , rather than
// encode , for the extension name.

// Like classes, extensions can’t be located inside of a function.
// So add the following code somewhere outside of main :

// extension on String {
//   String get encoded{
//     final output = StringBuffer();
//     for(final codePoint in runes){
//       output.writeCharCode(codePoint+1);
//     }
//     return output.toString();
//   }
// }
// Look at what’s changed here from its previous form as a function:

// The keywords extension on are what make this an extension. You can
// add whatever you want inside the body. It’s as if String were your own class now.

// Rather than making a normal method, you can use a getter method.
// This makes it so that you can call the extension using
// encoded , without the parentheses, rather than encoded().

// Since you’re inside String already, there’s no need to pass input as
// an argument. If you need a reference to the string object, you can
// use the this keyword. Thus, instead of input.runes, you could write this.runes.
// However, this is unnecessary and you can directly access runes.
// Remember that runes is a member of String and you’re inside String.

// void main(List<String> args) {
//   final original = 'abc';
//   final secret = encode(original);

//   final secretEx = 'abc'.encoded;

//   print(secret);
//   print(secretEx);
// }
// Adding a Decode Extension
// Add the decoded method inside the body of the String extension as well:

// String get decoded{
//   final output = StringBuffer();
//   for(final codePoint in runes){
//     output.writeCharCode(codePoint -1);
//   }
//   return output.toString();
// }

// If you compare this to the encoded method, though, there’s a lot of
// code duplication. Whenever you see code duplication,
// you should think about how to make it DRY.

// Refactoring to Remove Code Duplication
// Refactor your String extension by replacing the entire
// extension with the following:
extension on String {
  String get encoded => _code(1);
  String get decoded => _code(-1);

  String _code(int step) {
    final output = StringBuffer();
    for (final codePoint in runes) {
      output.writeCharCode(codePoint + step);
    }
    return output.toString();
  }
}
// Now the private _code method factors out all of the common parts
// of encoded and decoded . That’s better

// Int Extension Example

extension on int {
  int get cubed {
    return this * this * this;
  }
}


// void main(List<String> args) {
//   final original = "I like extensions!";
//   final secret = original.encoded;
//   final revealed = secret.decoded;

//   print(7.cubed); //343

//   print(secret);
//   print(revealed);
// }

// Challenge 1: Time to Code
// 1. Dart has a Duration class for expressing lengths of time. Make an
// extension on int so that you can express a duration like so:

extension on int{
  Duration get minutes => Duration(minutes: this);
}

void main(List<String> args) {
  final timeRemaining = 3.minutes;
  print(timeRemaining);
}
// Key Points

// Extension methods allow you to give additional functionality
// to classes that are not your own.

// Use extensions when they make sense, but try not to overuse them.

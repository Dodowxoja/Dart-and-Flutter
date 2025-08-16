// Constructors are special functions that create instances of classes.
// Here is main Types of constructors:

// • Generative constructors: Creates new instances and initializes instance variables.

// • Default constructors: Used to create a new instance when a constructor hasn't
// been specified. It doesn't take arguments and isn't named.

// • Named constructors: Clarifies the purpose of a constructor or allows
// the creation of multiple constructors for the same class.

// • Constant constructors: Creates instances as compile-type constants.

// • Factory constructors: Either creates a new instance of a subtype or
// returns an existing instance from cache.

// • Redirecting constructor: Forwards calls to another constructor in the same class.

// ---------------------------------------------------
// Generative constructors
// To instantiate a class, use a generative constructor.
class Point {
  // Instance variables to hold the coordinates of the point.
  double x;
  double y;

  // Generative constructor with initializing formal parameters:
  Point(this.x, this.y);
}

// ---------------------------------------------------
// Default constructors
// If you don't declare a constructor, Dart uses the default constructor.
// The default constructor is a generative constructor without arguments or name.

// ---------------------------------------------------
// Named constructors
// Use a named constructor to implement multiple constructors for a class
// or to provide extra clarity:
const double xOrigin = 0;
const double yOrigin = 0;

class PointNamed {
  final double x;
  final double y;

  // Sets the x and y instance variables
  // before the constructor body runs.
  PointNamed(this.x, this.y);

  // Named constructor
  PointNamed.origin() : x = xOrigin, y = yOrigin;
}

// A subclass doesn't inherit a superclass's named constructor.
// To create a subclass with a named constructor defined in the superclass,
// implement that constructor in the subclass.

// ---------------------------------------------------
// Constant constructors
// If your class produces unchanging objects, make these objects
// compile-time constants. To make objects compile-time constants,
// define a const constructor with all instance variables set as final.
class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);

  final double x, y;

  const ImmutablePoint(this.x, this.y);
}
// Constant constructors don't always create constants.
// They might be invoked in a non-const context.

// ---------------------------------------------------
// Redirecting constructors
// A constructor might redirect to another constructor in the same class.
// A redirecting constructor has an empty body. The constructor
// uses this instead of the class name after a colon (:).
class RePoint {
  double x, y;

  // The main constructor for this class.
  RePoint(this.x, this.y);

  // Delegates to the main constructor.
  RePoint.alongXAxis(double x) : this(x, 0);
}

// ---------------------------------------------------
// Factory constructors
// When encountering one of following two cases of implementing
// a constructor, use the factory keyword:
// • The constructor doesn't always create a new instance of its class.
//   Although a factory constructor cannot return null, it might return:
//    •• an existing instance from a cache instead of creating a new one
//    •• a new instance of a subtype
// • You need to perform non-trivial work prior to constructing an instance.
//   This could include checking arguments or doing any other processing
//   that cannot be handled in the initializer list.

// The following example includes two factory constructors.
// • Logger factory constructor returns objects from a cache.
// • Logger.fromJson factory constructor initializes a final
// variable from a JSON object.
class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

// <<Factory constructors can't access this. keyword>>
// void main() {
//   var logger = Logger('UI');
//   logger.log('Button clicked');

//   var logMap = {'name': 'UI'};
//   var loggerJson = Logger.fromJson(logMap);
//   loggerJson.log('Button clicked from JSON');
// }

// ---------------------------------------------------
// Instance Variable Initialization
// Dart can initialize variables in three ways:
// • Initialize instance variables in the declaration
// • Use initializing formal parameters (Constructor Initialization)
// • Use an initializer list

// <1> Initialize the instance variables when you declare the variables.
class User {
  String name = 'Guest';
  int age = 18;
}

// <2> To simplify the common pattern of assigning a constructor argument to an instance variable,
// Dart has initializing formal parameters.
class PointB {
  final double x;
  final double y;

  // Sets the x and y instance variables
  // before the constructor body runs.
  PointB(this.x, this.y);

  // Initializing formal parameters can also be optional.
  PointB.optional([this.x = 0.0, this.y = 0.0]);
}

// <3> Before the constructor body runs, you can initialize instance variables. Separate initializers with commas.

// Initializer list sets instance variables before
// the constructor body runs.
class Point3 {
  double x;
  double y;
  Point3.fromJson(Map<String, double> json) : x = json['x']!, y = json['y']! {
    print('In Point.fromJson(): ($x, $y)');
  }
}


// ---------------------------------------------------
// Constructor inheritance
// Subclasses, or child classes, don't inherit constructors from their superclass, or immediate parent class.
// If a class doesn't declare a constructor, it can only use the default constructor.
// A class can inherit the parameters of a superclass. These are called super parameters
// Constructors work in a somewhat similar way to how you call a chain of static methods.
// Each subclass can call its superclass's constructor to initialize an instance, like a subclass can
// call a superclass's static method. This process doesn't "inherit" constructor bodies or signatures.

class Person {
  String? firstName;

  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson().
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
  }
}

void main() {
  var employee = Employee.fromJson({});
  print(employee);
  // Prints:
  // in Person
  // in Employee
  // Instance of 'Employee'
}

// ---------------------------------------------------
// Super parameters
// To avoid passing each parameter into the super invocation of a constructor, use super-initializer
// parameters to forward parameters to the specified or default superclass constructor. You can't
// use this feature with redirecting constructors. Super-initializer parameters have syntax
// and semantics like initializing formal parameters.

class Vector2d {
  final double x;
  final double y;

  Vector2d(this.x, this.y);
}

class Vector3d extends Vector2d {
  final double z;

  // Forward the x and y parameters to the default super constructor like:
  // Vector3d(final double x, final double y, this.z) : super(x, y);
  Vector3d(super.x, super.y, this.z);

    // If you invoke the super constructor (`super(0)`) with any
  // positional arguments, using a super parameter (`super.x`)
  // results in an error.
  // Vector3d.xAxisError(super.x): z = 0, super(0); // BAD
}


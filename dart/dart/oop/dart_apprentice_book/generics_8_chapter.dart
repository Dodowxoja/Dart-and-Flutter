// Creating Generic Classes

// Collections are where you see generics the most, so to give
// you something to practice on, you’re going to create a generic
// collection called a tree. Trees are an important data structure
// you’ll find in many computer science applications. Some examples include:

// Binary trees.

// Binary search trees.

// Priority Queues.

// Flutter UI widget trees.

// A binary tree is one of the simplest types of trees. It consists
// of nodes, where each node can have up to two children. The image
// below illustrates this:

// *Starting With a Non‐Generic Integer Class*

// You’ll begin by creating a node and a tree in a non-generic way.
// Then, you’ll generalize your approach so it can handle any data type.

class IntNode {
  IntNode(this.value);
  int value;

  IntNode? leftChild;
  IntNode? rightChild;
}

// IntNode has three properties. The constructor allows you to set the node’s
// value.leftChild and rightChild are optional because not every node has children.

IntNode createIntTree() {
  final zero = IntNode(0);
  final one = IntNode(1);
  final five = IntNode(5);
  final seven = IntNode(7);
  final eight = IntNode(8);
  final nine = IntNode(9);

  seven.leftChild = one;
  one.leftChild = zero;
  one.rightChild = five;
  seven.rightChild = nine;
  nine.leftChild = eight;

  return seven;
}

// You return seven because it’s the root node and contains the links
// to the other nodes in the tree. Returning any other node would only
// provide a portion of the tree. Parents link to their children, not
// the other way around.

// Reimplementing the Tree With String Nodes
// You’ve built an integer tree. What would you need to change if you
// wanted to put strings in the tree like so:

// For that, you would need to change the node’s data type. However,
// you can’t change the data type of value in IntTree without messing
// up the integer tree you made earlier. So create a new class like the one below:

class StringNode {
  StringNode(this.value);
  String value;

  StringNode? leftChild;
  StringNode? rightChild;
}

// Now, value is of type String instead of int
StringNode createStringTree() {
  final zero = StringNode('zero');
  final one = StringNode('one');
  final five = StringNode('five');
  final seven = StringNode('seven');
  final eight = StringNode('eight');
  final nine = StringNode('nine');

  seven.leftChild = one;
  one.leftChild = zero;
  one.rightChild = five;
  seven.rightChild = nine;
  nine.leftChild = eight;

  return seven;
}
// The logic is all the same as the IntNode tree you made earlier.
// Create the tree in main like so:

// Comparing the Duplication
// Currently, you’ve got a lot of code duplication.
// And what if you wanted to make a tree of Boolean values?
// And then, if you decided you needed a tree of floating-point values
// And on it goes for every new data type you want to use. You must create
// a new class to hold the new type, duplicating lots of code each time.

// Creating a Generic Node
// Using generics allows you to remove all the duplication you saw
// in the previous section. Add the following class to your project:

class Node<T> {
  T value;
  Node(this.value);

  Node<T>? leftChild;
  Node<T>? rightChild;

  @override
  String toString() {
    final left = leftChild?.toString() ?? '';
    final parent = value.toString();
    final right = rightChild?.toString() ?? '';
    return '$left $parent $right';
  }
}
// This time, the angle brackets show that this is a class with
// a generic type. The T here represents any type. You don’t have
// to use the letter T, but it’s customary to use single
// capital letters when specifying a generic type.

// Updating the Integer Tree
Node<int> createIntNodes() {
  final zero = Node(0);
  final one = Node(1);
  final five = Node(5);
  final seven = Node(7);
  final eight = Node(8);
  final nine = Node(9);

  seven.leftChild = one;
  one.leftChild = zero;
  one.rightChild = five;
  seven.rightChild = nine;
  nine.leftChild = eight;

  return seven;
}

// This time, the return type is Node<int> instead of IntNode.
// You specify int inside the angle brackets so users of createIntNodes
// know the values inside the tree are integers. Hover your cursor over
// zero, and you’ll see that Dart already infers the type to be Node<int>
// because it knows 0 is an integer.

// Updating the String Tree
Node<String> createStringNodes() {
  final zero = Node('zero');
  final one = Node('one');
  final five = Node('five');
  final seven = Node('seven');
  final eight = Node('eight');
  final nine = Node('nine');

  seven.leftChild = one;
  one.leftChild = zero;
  one.rightChild = five;
  seven.rightChild = nine;
  nine.leftChild = eight;

  return seven;
}

// void main(List<String> args) {
//   final intTree = createIntTree();
//   final intTreeGeneric = createIntNodes(); // made from Generic
//   final stringTree = createStringTree();
//   final stringTreeGeneric = createStringTree(); // made from Generic
// }

// Creating Generic Functions

Node<E>? createTree<E>(List<E> nodes, [int index = 0]) {
  if (index >= nodes.length) return null;

  final node = Node(nodes[index]);

  final leftChildIndex = 2 * index + 1;
  final rightChildIndex = 2 * index + 2;

  node.leftChild = createTree(nodes, leftChildIndex);
  node.rightChild = createTree(nodes, rightChildIndex);

  return node;
}

// void main(List<String> args) {
//   final tree = createTree([7, 1, 9, 0, 5, 8]);
//   print(tree?.value);
//   print(tree?.leftChild?.value);
//   print(tree?.rightChild?.value);
//   print(tree?.leftChild?.leftChild?.value);
//   print(tree?.leftChild?.rightChild?.value);
//   print(tree?.rightChild?.leftChild?.value);
//   print(tree?.rightChild?.rightChild?.value);
// }

// Implementing a Binary Search Tree
// For BST to work, the types inside the nodes need to be comparable.
// It wouldn’t make sense to create a BST of User objects or Widget
// objects because these objects aren’t inherently comparable. That means
// you need a way of restricting the element type within the BST nodes.

// The solution is to use the extends keyword. By only allowing data types
// that extend Comparable , you can guarantee the values in all the
// nodes will be comparable.

// E represents the type of the elements in the tree.

// The extends keyword goes inside the angle brackets to restrict the types
// that E can be. Only types that extend Comparable are allowed.

// You’ll use the same Node class that you created earlier.

class BinarySearchTree<E extends Comparable<E>> {
  Node<E>? root;

  void insert(E value) {
    root = _insertAt(root, value);
  }

  Node<E> _insertAt(Node<E>? node, E value) {
    if (node == null) return Node(value);

    if (value.compareTo(node.value) < 0) {
      node.leftChild = _insertAt(node.leftChild, value);
    } else {
      node.rightChild = _insertAt(node.rightChild, value);
    }

    return node;
  }

  @override
  String toString() => root.toString();
}

// void main(List<String> args) {
//   var tree = BinarySearchTree<num>();
//   tree.insert(7);
//   tree.insert(1);
//   tree.insert(9);
//   tree.insert(0);
//   tree.insert(5);
//   tree.insert(8);
//   print(tree);
// }
// You specified the type as num rather than int because int doesn’t
// directly implement Comparable , whereas num does.

// Challenge 1: A Stack of Numbers

// A stack is a first-in-last-out (FILO) data structure. When you
// add new values, you put them on top of the stack, covering up
// the old values. Likewise, when you remove values from the
// stack, you can only remove them from the top of the stack.

// Create a class named IntStack with the following methods:
// push : adds an integer to the top of the stack.
// pop : removes and returns the top integer from the stack.
// peek : tells the value of the top integer in the stack without removing it.
// isEmpty : tells whether the stack is empty or not.
// toString : returns a string representation of the stack.
// Use a List as the internal data structure.

class IntStack {
  List<int> _list = [];

  void push(int value) => _list.add(value);

  int pop() => _list.removeLast();
  int peek() => _list.last;
  bool isEmpty() => _list.isEmpty;

  @override
  String toString() => _list.toString();
}

// Challenge 2: A Stack of Anything

class Stack<E> {
  List<E> _list = [];

  void push(E value) => _list.add(value);

  E pop() => _list.removeLast();

  E peek() => _list.last;

  bool isEmpty() => _list.isEmpty;

  @override
  String toString() {
    return _list.toString();
  }
}

// void main(List<String> args) {
//   var intStack = Stack<int>();
//   print(intStack.isEmpty());
//   intStack.push(12);
//   intStack.push(54);
//   intStack.push(3);
//   print(intStack);
// }

// Key Points

// Generics allow classes and functions to accept data of any type.

// The angle brackets surrounding a type tell the class or
// function the data type it will use.

// Use the letter T as a generic symbol for any single type.

// Use the letter E to refer to the element type in a generic collection.

// You can restrict the range of allowable types by using the extends
// keyword within the angle brackets.

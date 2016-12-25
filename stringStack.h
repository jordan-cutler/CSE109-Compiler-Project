#ifndef STRINGSTACK_H
#define STRINGSTACK_H

#include <iostream>
#include <string>
using namespace std;

class StringStack {
public:
  // Constructors
  StringStack(int n);
  StringStack(); // Default constructor
  // Destructor
  ~StringStack();

  // Regular Member Functions
  void push(const string val);
  string pop();
  string peek() const;
  bool contains(const string val);
  bool isEmpty();

  // Overloaded Operator Member Functions
  //  const HashTable& operator [](int i) const; // rvalue

  string operator [](int i); // lvalue

  int getTos();

private:
  string* stack;
  int size;
  int tos;
  static const int EMPTY = -1;
  void checkIndex(int i) const;
};

#endif

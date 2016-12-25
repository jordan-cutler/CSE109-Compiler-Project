#include <cstdlib>
#include "stringStack.h"
#include <string>

StringStack::StringStack(int n):size(n),tos(EMPTY) { // initializes size to
  // be n and tos to be
  // the value of EMPTY,
  // which is -1
  stack = new string[size];
}

StringStack::StringStack():size(973),tos(EMPTY) {
  stack = new string[size];
}

StringStack::~StringStack() {
  /*  if (stack != NULL) {
    delete [] stack;
    }*/
}

void StringStack::push(const string val) {
  //  cout << "pushed" << endl;
  if (tos >= size - 1) {
    cerr << "Stack overflow\n";
    exit(1);
  } else {
    stack[++tos] = val;
  }
}

string StringStack::pop() {
  if (tos < 0) {
    cerr << "Stack underflow\n";
    exit(1);
  } else {
    return stack[tos--];
  }
}

bool StringStack::isEmpty() {
  if (tos < 0) {
    return true;
  }
  else {
    return false;
  }
}

int StringStack::getTos() {
  return tos;
}

string StringStack::peek() const {
  if (tos < 0) {
    cerr << "Peek on empty stack!\n";
    exit(1);
  } else {
    return stack[tos];
  }
}

void StringStack::checkIndex(int i) const {
  if (i < 0 || i > tos) {
    cerr << "Index out of bounds\n";
    exit(1);
  }
}

bool StringStack::contains(const string val) {
  for (int i = tos; i >= 0; i--) {
    if (stack[i] == val) {
      return true;
    }
  }
  return false;
}

string StringStack::operator [](int i){
  //  cout << "lvalue []\n";
  checkIndex(i);
  return stack[i];
}

#include <cstdlib>
#include "stack.h"
#include "hashTable.h"

Stack::Stack(int n):size(n),tos(EMPTY) { // initializes size to
						// be n and tos to be
						// the value of EMPTY,
						// which is -1
  stack = new HashTable*[size];
}

Stack::Stack():size(10),tos(EMPTY) {
  stack = new HashTable*[size];
}

Stack::~Stack() {
  if (stack != NULL) {
      delete [] stack;
  }
}

void Stack::push(HashTable* val) {
  if (tos >= size - 1) {
    cerr << "Stack overflow\n";
    exit(1);
  } else {
    stack[++tos] = val;
  }
}

HashTable* Stack::pop() {
  if (tos < 0) {
    cerr << "Stack underflow\n";
    exit(1);
  } else {
    return stack[tos--];
  }
}

HashTable* Stack::peek() const {
  if (tos < 0) {
    cerr << "Peek on empty stack!\n";
    exit(1);
  } else {
    return stack[tos];
  }
}

int Stack::getTos() {
  return tos;
}

void Stack::checkIndex(int i) const {
  if (i < 0 || i > tos) {
    cerr << "Index out of bounds\n";
    exit(1);
  }
}

HashTable* Stack::operator [](int i){
  checkIndex(i);
  return stack[i];
}


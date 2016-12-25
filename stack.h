/*J Femister
  CSE 109 - 010
  Fall 2015
*/

#ifndef STACK_H
#define STACK_H

#include <iostream>
class HashTable;
using namespace std;

/* 
   A simple implementation of a stack for HashTables
*/

class Stack {
public:
  // Constructors
  Stack(int n);
  Stack(); // Default constructor
  //  Stack(const Stack& s); // Copy Constructor - deep copy // recreates
		       // the stack through copying fields. Compiler
		       // identifies the parameter as a copy constructor
  // Destructor
  ~Stack();

  // Regular Member Functions
  void push(HashTable* val);
  HashTable* pop();
  HashTable* peek() const;

  // Overloaded Operator Member Functions
  //  const HashTable& operator [](int i) const; // rvalue

  HashTable* operator [](int i); // lvalue

  int getTos();
  
private:
  HashTable** stack;
  int size;
  int tos;
  static const int EMPTY = -1;
  void checkIndex(int i) const;
};

#endif


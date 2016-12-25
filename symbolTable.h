#ifndef SYMBOLTABLE_H
#define SYMBOLTABLE_H

#include "hashTable.h"
#include "hash.h"
#include "link.h"
#include "stack.h"
#include <iostream>
#include <string>
#include <cstdlib>
#include <sstream>

using namespace std;

class SymbolTable {
public:
  SymbolTable();
  ~SymbolTable();
  void enterScope();
  void exitScope();
  bool addSymbol(string str);
  string getUniqueSymbol(string str);

private:
  Stack hashTableStack;
  int counter;
  string itos(int i) { stringstream ss; ss << i; string res = ss.str(); return res;}
};

#endif

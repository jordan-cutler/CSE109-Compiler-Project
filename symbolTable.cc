/*
  CSE 109
  Jordan Cutler
  jdc219
  Program Description: Contains a stack of hashTables. Used for
  variable declaration and error checking.
  Program #6
*/

#include "symbolTable.h"
#include <string>

SymbolTable::SymbolTable():hashTableStack(40) {
  counter = 0;
}

SymbolTable::~SymbolTable() {

}

void SymbolTable::enterScope() {
  hashTableStack.push(new HashTable());
}

void SymbolTable::exitScope() {
  hashTableStack.pop();
}

bool SymbolTable::addSymbol(string str) {
  HashTable* toAdd = hashTableStack.peek();
  if (toAdd->inTable(str)) {
    return false;
  }
  else {
    string index = str + "$" + itos(++counter);
    toAdd->add(str, index);
  }
  return true;
}

string SymbolTable::getUniqueSymbol(string str) {
  for (int i = hashTableStack.getTos(); i >= 0; i--) {
    HashTable* currentHashTable = hashTableStack[i];
    if (currentHashTable->inTable(str)) {
      return (*currentHashTable)[str];
    }
  }
  return "";
}

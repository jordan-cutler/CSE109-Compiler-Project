#include "hashTable.h"
#include <string>

HashTable::HashTable():size(97) {
  table = new Link*[size];
  for (int j = 0; j < size; j++) {
    table[j] = NULL;
  }
}

HashTable::~HashTable(){
  for(int j = 0; j < size; j++)
    if(table[j] != NULL)
      delete table[j];
  delete [] table;
}

HashTable& HashTable::add(const string str, string d){
  int h;
  check(!inTable(str),"(add()) Duplicate key");
  h = Hash(str).hash() % size;
  table[h] = new Link(str, d, table[h]);
  check(table[h] != NULL, "(add()) Heap overflow");
  return *this;
}

bool HashTable::inTable(const string k) const{
  int h;
  Link *temp;
  h = Hash(k).hash() % size;
  temp = table[h];
  while(temp != NULL && temp->key != k) {
    temp = temp->next;
  }
  return temp != NULL;
}

const string HashTable::operator [](const string str) const {
  int h;
  Link *temp;
  h = Hash(str).hash() % size;
  temp = table[h];
  while(temp != NULL && temp->key != str) {
    temp = temp->next;
  }
  return temp->data;
}

void HashTable::check(bool b, string mess){
  if(!b){
    cerr << "ERROR[HashTable]: " << mess << endl;
    exit(1);
  }
}

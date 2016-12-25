#ifndef HASHTABLE_H
#define HASHTABLE_H
#include "hash.h"
#include "stack.h"
#include "link.h"
#include <iostream>
#include <cstring>
#include <string>
#include <cstdlib>

using namespace std;

class HashTable{
public:
  HashTable();
  ~HashTable();

  HashTable& add(const string str, string d);

  bool inTable(const string str)const;

  const string operator [](const string str) const;

private:
  int size;   //the size of the array table
  Link **table;  //dynamically allocated array of pointers, each
		 //pointer pointing to a linked list of Links or NULL

  // if b is true do nothing, else display on cerr the error message and exit
  static void check(bool b, string str);
};

#endif

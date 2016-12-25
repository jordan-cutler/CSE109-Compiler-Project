#ifndef HASH_H
#define HASH_H
#include <string>
#include <iostream>
#include <cstdlib>
using namespace std;

class Hash{
public:
  Hash(string str);
  int key;
  int hash() const;  //return the hash value
};
#endif

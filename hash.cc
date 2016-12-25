#include "hash.h"
#include <string>
#include <cstdlib>

Hash::Hash(string str) {
  int tmp = 0;
  char currentLetter = str.length() - 1;
  while(currentLetter) { // while p is pointing to a non-zero character
    tmp += str[currentLetter--];
  }
  key = abs(tmp);
}

int Hash::hash() const{
  return key;
}

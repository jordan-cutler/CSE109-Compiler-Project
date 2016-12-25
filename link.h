#ifndef LINK_H
#define LINK_H
#include <string>
using namespace std;

class Link{
public:
  string key;  //used to identify the Links; should be unique
  string data;  //the actual information
  Link *next;

  /*Set key=k, data=d, next=nx*/
  Link(string k, string d, Link *nx = NULL);

  /*Make a copy of the link t. Note that we copy the pointer, thus not
  a deep copy
  */
  Link(const Link & t);

};

#endif

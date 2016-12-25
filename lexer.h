#ifndef LEXER_H
#define LEXER_H
#include "token.h"
#include <iostream>
#include <string>

using namespace std;

class Lexer {
public:
  Lexer(istream &stream);
  ~Lexer();
  Token nextToken();
  istream &refToInputStream;
  int pos;
  int line;
  char ch;
  char next;
  const static string keywords[];
  const static int keywordsIntValues[];
  const static string specialCharacters[];
  const static int specialCharactersIntValues[];
  const static unsigned int keywordsLength = 7;
  const static unsigned int specialCharactersLength = 19;
private:
  char nextChar();  
};

#endif

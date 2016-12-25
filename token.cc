#include "token.h"
#include <iostream>
#include <string>
using namespace std;
/*
  CSE 109
  Jordan Cutler
  jdc219
  Class Description: Token objects are returned when a lexer object
  calls on nextToken() from the main function. A token has a type,
  lexeme, line, and position. The position is the position of the
  first character of the token, and begins at 0. The first line is 1.
  Program #4
*/

// Default constructor for token object
Token::Token() {
  type = 0;
  lexeme = "";
  line = 1;
  pos = 0;
}

// 4 arg constructor for token object
Token::Token(int type, string lexeme, int line, int pos) {
  this->type = type;
  this->lexeme = lexeme;
  this->line = line;
  this->pos = pos;
}

// getter method for type instance variable
int Token::getType() {
  return type;
}

// getter method for lexeme instance variable
string Token::getLexeme() {
  return lexeme;
}

// getter method for line instance variable
int Token::getLine() {
  return line;
}

// getter method for position instance variable
int Token::getPos() {
  return pos;
}


/*
  CSE 109
  Jordan Cutler
  jdc219
  Program Description: Main method takes in a file as an input stream
  and passes it when creating a lexer object. It then calls on
  nextToken() and prints out the fields of each token until it reads a
  endoffile character. 
  Program #4
*/

#include "token.h"
#include "lexer.h"
#include <iostream>
#include <fstream>

using namespace std;

void processFile(istream& in) {
  Lexer lexer(in);
  Token token;

  token = lexer.nextToken();
  printf(" Type     Lexeme    Line #    Pos\n");
  while (token.getType() != Token::ENDOFFILE) {
    printf("%5d     %-10s %5d  %5d\n", token.getType(), token.getLexeme().c_str(),
	   token.getLine(), token.getPos());
    token = lexer.nextToken();
  }
}

int main(int argc, char* argv[]) {
  ifstream in;

  if (argc > 1) {
    in.open(argv[1]);
    processFile(in);
    in.close();
  } else {
    processFile(cin);
  }
}

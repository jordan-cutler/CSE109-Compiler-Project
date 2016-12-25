#include "token.h"
#include "lexer.h"
#include <stdio.h>
#include <string>
#include <cctype>
#include <iostream>
#include <cstdio>
#include <cstdlib>
using namespace std;

/*
  CSE 109
  Jordan Cutler
  jdc219
  Program Description: The lexer class has a method nextToken(), which
  is called on by a lexer object. The nextToken() method uses
  nextChar() to get characters which comprise of a lexeme within a
  token. nextChar() keeps track of the line and position number of the
  token and the nextToken() returns a token with all those fields
  including type. The nextToken() method figures out what type the
  token is through testing if it is a letter, digit, special
  character, and more.
  Program #4
*/

const string Lexer::keywords[] = {"if", "else", "while", "function", "var", "printf",
				  "return"};
const int Lexer::keywordsIntValues[] = {Token::IF, Token::ELSE, Token::WHILE, Token::FUNCTION,
					Token::VAR, Token::PRINTF, Token::RETURN};
const string Lexer::specialCharacters[] = {"+", "-", "*", "/", "=", "==", "!=", "<", "<=", ">",
					   ">=", "&&", "||", "(", ")", "{", "}", ",", ";"};
const int Lexer::specialCharactersIntValues[] = {Token::PLUS, Token::MINUS, Token::TIMES,
						 Token::DIVIDE, Token::ASSIGN, Token::EQ,
						 Token::NE, Token::LT, Token::LE, Token::GT,
						 Token::GE, Token::AND, Token::OR,Token::LPAREN,
						 Token::RPAREN, Token::LBRACE, Token::RBRACE,
						 Token::COMMA, Token::SEMICOLON};

// Constructor for Lexer object. Initializes pos to -1 because the
// first position is 0 and nextChar() will increment it.
Lexer::Lexer(istream &stream):refToInputStream(stream) {
  pos = -1;
  line = 1;
  next = ' ';
  ch = nextChar();
}

// nextChar() retrieves the next character to be added to the lexeme
// of a token
char Lexer::nextChar() {
  // Keep track of the previous character
  // Acquire next character in the input stream
  next = refToInputStream.get();
  // Return # if the next character is the end of file
  if (next == EOF) {
    return '#';
  }
  // Return a space if the next character is a new line. This tells
  // nextToken() that the next character is not a special character,
  // letter, or digit anymore
  else if (next == '\n') {
    pos = 0;
    line++;
    return ' ';
  }
  // If we are simply reading a character, increment position and
  // return the character
  else {
    pos++;
    return next;
  }
}

// nextToken() is called by a lexeme object from the main method and
// will return a token with a type, lexeme, position, and line #
Token Lexer::nextToken() {
  string lexeme = "";
  int type = 0;
  unsigned int i;
  // Keep running through nextChar until you reach
  // a character that is not a space.
  if (isspace(ch)) {
    ch = nextChar();
    while (isspace(ch)) {
      ch = nextChar();
    }
  }
  // Save the pos and line values
  int linePos = line;
  int startPos = pos;

  // If the character returned was a #, we know we reached the end of
  // the file. Therefore, we return a token with type 30
  if (ch == '#') {
    type = 30;
    lexeme += ch;
    return Token(type, lexeme, line, pos);
  }
  // If the first character is a letter, check if it is an identifier
  // or a keyword
  else if (isalpha(ch)) {
    // Add the initial character to the lexeme
    lexeme += ch;
    // Search for next character
    ch = nextChar();
    // If and while that next character is a letter, keep adding that
    // character to the lexeme and look for more letters
    while (isalpha(ch) || isdigit(ch)) {
      lexeme += ch;
      ch = nextChar();
    }
    for (i = 0; i < keywordsLength; i++) {
      // check if the lexeme string is a specific keyword
      if (lexeme == keywords[i]) {
	type = keywordsIntValues[i];
	// immediately break from for loop if match is found
	break; 
      }
      // assign type as identifier if match is not found
      type = 1;
    }
  }
  // Case for if the first character read is a digit
  else if (isdigit(ch)) {
    // We know that if a digit was read, it is of type 2
    type = 2;
    // Add the digit on to the lexeme
    lexeme += ch;
    // Look for next digit
    ch = nextChar();
    // If and while the next character is a digit, add the digits to
    // the lexeme and look for more digits
    while (isdigit(ch)) {
      lexeme += ch;
      ch = nextChar();
    }
  }
  // Case for if a quotation mark is found.
  else if(ch == '\"') {
    // We know that if a quote was read, it is of type 3
    type = 3;
    // Look for the character following the quote. Quote is not part
    // of the lexeme.
    ch = nextChar();
    // while loop until you read another ". Keep adding to the lexeme
    // until you find the ending quote.
    while (ch != '\"'){
      lexeme += ch;
      ch = nextChar();
    }
    // Searching for one character past the token (GOLDEN RULE)
    ch = nextChar();
  }
  // Case for if the token is a operator or special character
  else if(ispunct(ch)) {
    char temp = ch;
    lexeme += ch;
    ch = nextChar();
    // Later, we will check to see if we still did not find a match
    // with the array of special characters. If there was no match, an
    // error statement will print.
    bool foundMatch = false;
    // These are all punctuations that should operate ALONE, therefore
    // there is no need to search for more characters following these punctuations.
    if ((temp != '(') && (temp != ')') && (temp != '}') &&
	(temp != ',') && (temp != ';') && (temp != '{')) {
      while (ispunct(ch)) {
	lexeme += ch;
	ch = nextChar();
      }
    }
    // loop through all special characters and operators, checking
    // if the lexeme is equal to any of them. If they are, use the
    // corresponding type. If no matches, then error occurs.
    for (i = 0; i < specialCharactersLength; i++) {
      if (lexeme == specialCharacters[i]) {
	type = specialCharactersIntValues[i];
	foundMatch = true;
	break;
      }
    }
    // if foundMatch did not get set to true, an unrecognized
    // special character was used.
    if (foundMatch == false) {
      cout << "Incorrect special character. Exiting program." << endl;
      type = 31;
      exit(1);
    }
  }
  // If anything other than something we accounted for was used,
  // return an error
  else {
    type = 31;
    cout << "Error occurred" << endl;
  }
  return Token(type, lexeme, linePos, startPos);
}

// Destructor for lexer object
Lexer::~Lexer() {

}

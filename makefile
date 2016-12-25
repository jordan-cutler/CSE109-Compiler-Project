OPTS = -c -g -Wall -Werror -Wno-non-template-friend

microc: microc.o lexer.o token.o parser.o symbolTable.o stack.o hashTable.o hash.o link.o stringStack.o
	g++ -o microc microc.o lexer.o token.o parser.o symbolTable.o stack.o hashTable.o hash.o link.o stringStack.o

parser.o: parser.cc parser.h token.h lexer.h symbolTable.h stringStack.h
	g++ $(OPTS) parser.cc

microc.o: microc.cc parser.h lexer.h token.h symbolTable.h stack.h hashTable.h
	g++ $(OPTS) microc.cc

lextest: lextest.o token.o lexer.o
	g++ -o lextest lextest.o token.o lexer.o

lextest.o: lextest.cc token.h lexer.h lexer.cc
	g++ $(OPTS) lextest.cc

token.o: token.cc token.h
	g++ $(OPTS) token.cc

lexer.o: lexer.cc lexer.h token.h
	g++ $(OPTS) lexer.cc

stringStack.o: stringStack.cc stringStack.h
	g++ $(OPTS) stringStack.cc

symbolTable.o: symbolTable.cc symbolTable.h hashTable.h hash.h stack.h link.h
	g++ $(OPTS) symbolTable.cc

stack.o: stack.cc stack.h hashTable.h
	g++ $(OPTS) stack.cc

hashTable.o: hashTable.cc hashTable.h hash.h stack.h link.h
	g++ $(OPTS) hashTable.cc

hash.o: hash.cc hash.h
	g++ $(OPTS) hash.cc

link.o: link.cc link.h
	g++ $(OPTS) link.cc

clean:
	rm -f *.o lextest *~ *# microc

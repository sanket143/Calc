#LEX = flex -I
#YACC = byacc

CC = gcc -DYYDEBUG=1

calc: y.tab.o lex.yy.o
	$(CC) -o calc y.tab.o lex.yy.o -ly -lfl -lm

lex.yy.o: lex.yy.c y.tab.h

lex.yy.o y.tab.o: calc.h

y.tab.c y.tab.h: calc.y
	$(YACC) -d calc.y

lex.yy.c: calc.l
	$(LEX) calc.l

bc.out: flex.l bison.y
	bison -o bc.tab.c -d bison.y
	flex -o lex.bc.c flex.l
	cc -o -l  bc.tab.c lex.bc.c 

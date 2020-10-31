%{

#include<stdlib.h>
#include<stdio.h>

%}

%token D_INT
%token EOL

%%

cac : |cac exp EOL {printf("ans = %d\n",$2);};

exp:fac
	| exp '+' fac {$$ = $1 + $3;}
	| exp '-' fac {$$ = $1 - $3;}
	;

fac :trm
	| fac '*' trm {$$ = $1 * $3;}
	| fac '/' trm {
		if (!$3){
			perror ("divide by zero!");
			exit(EXIT_SUCCESS);
			}
		else $$ = $1 / $3;
		}
		;

trm : D_INT 
	| '|' trm {$$ = $2 < 0?-$2:$2;}
	;

%%

int main(int arc,char **argv){
	yyparse();
	return 0;
	}

int yyerror(char *s_err){

	fprintf(stderr,"error %s\n",s_err);
	return 0;
}



/* scanner for a toy pascal_like language */

%{
/* need this for the call to atof(0 below */
#include<math.h>
%}

DIGIT [0-9]
ID [a-z][a-z0-9]

%%
{DIGIT}+ {
	printf("An integer :%s(%d)\n",yytext,atoi(yytext));
}

{DIGIT}+"."{DIGIT}* {
	printf("A float :%s(%g)\n",yytext,atof(yytext));
}

if|then|begin|eng|procedure|function {
	printf("A keyword:%s\n",yytext);
}

{ID} printf("An identifier:%s\n",yytext);

"+"|"-"|"*"|"/" printf("An operator :%s\n");

"{"[\^{}}\n]*"}" 
[\t\n]+ 
.  printf("unrecognized character :%s\n");

%%

int main(int argc,char ** argv){
	++argv,__argc;
	if(argc>0)
		yyin = fopen(argv[0],"r");
	else 
		yyin = stdin ;
	yylex();
	}

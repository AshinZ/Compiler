%{

#include"bc.tab.h"

%}

INT   [-+]?[0-9]+
%%
"+" {return '+';}
"-" {return '-';}
"*" {return '*';}
"/" {return '/';}
"|" {return '|';}

{INT} { yylval = atoi(yytext );return D_INT;}

\n  {return EOL;}
[\t] {}

. { fprintf(stderr,"rllegal character %c \n",*yytext);}

%%

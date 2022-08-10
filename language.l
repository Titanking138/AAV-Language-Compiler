%{ 
 #include <stdlib.h> 
 void yyerror(char *); 
 #include "language.tab.h" 
%}



%% 

 /* variables */ 
[a-zA-Z]([a-zA-Z]|[0-9])*   { 
 yylval = *yytext - 'a'; 
 return VARIABLE; 
 } 
 /* integers */ 
[0-9]+ { 
 yylval = atoi(yytext); 
 return INTEGER; 
 } 

[0-9]*['.']([0-9])+ { 
 yylval = atof(yytext);
 return FLOAT; 
}

 /* operators */ 
[-+()=/*\n] { return *yytext; } 
 /* skip whitespace */ 
[ \t] ; 
 /* anything else is an error */ 
. yyerror("invalid character"); 



%% 
int yywrap(void) { 
 return 1; 
}
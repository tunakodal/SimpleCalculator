%{
    #include "y.tab.h"
    #include <stdlib.h>
    #include <stdio.h>
    int yyerror(char *s);
}%

%%

[0-9]+\.[0-9]+ { // floating points
    yylval = atof(yytext);
    return NUMBER;
}

[0-9]+ { // integers
    yylval = atof(yytext);
    return NUMBER;
}

"**" { return EXP; }
"^" { return EXP; }

"+" { return PLUS; } // operators
"-" { return MINUS; }
"*" { return TIMES; }
"/" { return DIVIDE; }
"(" { return LPAREN; }
")" { return RPAREN; }

[ \t\n]+; // ignoring white spaces

. { // invalid error
    printf("invalid expression: %s\n", yytext);
    yyerror("invalid expression");
} 

%%

int yywrap() { // EOF
    return 1;
}
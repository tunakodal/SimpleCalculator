%{
    #include "y.tab.h"
    #include <stdlib.h>
}%

%%

[0-9]+\.[0-9]+ { // floating points
    yylval = atof(yytext);
    return NUMBER;
}

[0-9]+ { // integers
    yylval = atoi(yytext);
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
    printf("invalid expression: %s\n", yytext)
    return 0;
} 

%%

int yywrap() { // EOF
    return 1;
}
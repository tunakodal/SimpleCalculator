%{
    #include "y.tab.h"
    #include <stdlib.h>
    #include <math.h>
}%

%token NUMBER PLUS MINUS TIMES DIVIDE LPAREN RPAREN EXP
%left PLUS MINUS
%left TIMES DIVIDE
%right EXP

%%

expr : expr PLUS expr { $$ = $1 + $3; } 
     | expr MINUS expr { $$ = $1 - $3; }
     | expr TIMES expr { $$ = $1 * $3; }
     | expr DIVIDE expr {
        if($3 == 0) {
            yyerror("division by zero");
            YYABORT;
        }
        else {
            $$ = $1 / $3;
        }       
     }
     | expr EXP expr { $$ = pow($1,$3); }
     | LPAREN expr RPAREN{ $$ = $2; }
     | NUMBER { $$ = $1; }

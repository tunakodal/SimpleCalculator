%{
    #include "y.tab.h"
    #include <stdio.h>
    #include <stdlib.h>    
    #include <math.h>
    int yyerror(char *s);
    int yylex(void);
%}

%union {
    double val;
}

%token <val> NUMBER
%token PLUS MINUS TIMES DIVIDE LPAREN RPAREN EXP
%type <val> expr

%left PLUS MINUS
%left TIMES DIVIDE
%right EXP

%start input

%%

input:
      /* empty */
    | input line
    ;

line:
      expr '\n' { printf("result: %lf\n", $1); }
    | '\n'
    ;

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
     | LPAREN expr RPAREN { $$ = $2; }
     | NUMBER { $$ = $1; }
     ;

%%

int main() {
    yyparse();
    return 0;
}

int yyerror(char *s) {
    printf("%s\n", s);
    return 0;
}
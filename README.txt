How to run

    lex calculator.l
    yacc -d calculator.y
    gcc lex.yy.c y.tab.c -o calculator -lm
    ./calculator

---------

Design decisions

In the Lex file, the defined tokens were captured using regular expressions.
Whitespace characters were ignored, and appropriate error messages were added 
for invalid expressions. For floating-point support, an additional regular expression was introduced,
and both integer and floating-point values were handled as double to ensure correct computation.

The defined grammar was implemented in the Yacc file, 
and an additional rule was added to handle exponentiation.
Division by zero was also explicitly handled to prevent runtime errors.

The program is executed as specified. 
After entering an expression, the result 
is obtained by signaling EOF using CTRL+D.


---------

Test cases

2 + 5 * 3
Result: 17.000000

-

(2 + 5) * 3
Result: 21.000000

-

(2^4) / (2^2) * 3
Result: 12.000000

-

(5 / 2) * (9 / 3) + 2
Result: 9.500000

-

5 /     0
division by zero

-

abc
a -  invalid expression

b -  invalid expression

c -  invalid expression
syntax error

-

2 - - 
syntax error
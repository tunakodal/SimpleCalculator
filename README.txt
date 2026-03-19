How to run?

    lex calculator.l
    yacc -d calculator.d
    gcc lex.yy.c y.tab.c -o calculator -lm
    ./calculator

Design choices

Test Cases:

2 + 5 * 3
Result: 17.000000

(2 + 5) * 3
Result: 21.000000

(2^4) / (2^2) * 3
Result: 12.000000

(5 / 2) * (9 / 3) + 2
Result: 9.500000

5 /     0
division by zero

# Simple Calculator

A command-line calculator built with Lex and Yacc. It evaluates arithmetic expressions with integers and floating-point numbers, parentheses, and exponentiation.

## Repository Structure

```
.
├── src/
│   ├── calculator.l   lexer (token definitions)
│   └── calculator.y   parser (grammar and evaluation)
└── README.md
```

## How to Run

```bash
cd src
lex calculator.l
yacc -d calculator.y
gcc lex.yy.c y.tab.c -o calculator -lm
./calculator
```

Type an expression and press CTRL+D (EOF) to get the result.

## Design Decisions

**Lexer (`calculator.l`)**
- Tokens are captured with regular expressions.
- Whitespace is ignored, and invalid characters produce an error message.
- An additional regular expression adds floating-point support. Integers and floating-point values are both handled as `double` to keep the computation correct.
- Exponentiation is accepted as either `^` or `**`.

**Parser (`calculator.y`)**
- The grammar supports `+`, `-`, `*`, `/`, parentheses and exponentiation, with standard operator precedence (exponentiation is right-associative).
- Division by zero is handled explicitly to prevent runtime errors.

## Test Cases

| Input | Output |
| --- | --- |
| `2 + 5 * 3` | `Result: 17.000000` |
| `(2 + 5) * 3` | `Result: 21.000000` |
| `(2^4) / (2^2) * 3` | `Result: 12.000000` |
| `(5 / 2) * (9 / 3) + 2` | `Result: 9.500000` |
| `5 / 0` | `division by zero` |
| `abc` | `a - invalid expression`, `b - invalid expression`, `c - invalid expression`, `syntax error` |
| `2 - -` | `syntax error` |

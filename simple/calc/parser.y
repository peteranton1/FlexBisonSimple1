%{
#include <stdio.h>
#include <stdlib.h>

// Declare external functions to prevent compiler warnings
int yylex(void);
void yyerror(const char *s);
%}

/* Define the tokens received from the lexer */
%token NUMBER PLUS MINUS NEWLINE

/* Define operator precedence and associativity */
%left PLUS MINUS

%%

/* Grammar rules */
program:
    | program line
    ;

line:
    NEWLINE
    | expr NEWLINE { printf("Result: %d\n", $1); }
    ;

expr:
    NUMBER          { $$ = $1; }
    | expr PLUS expr  { $$ = $1 + $3; }
    | expr MINUS expr { $$ = $1 - $3; }
    ;

%%

/* Error handling function */
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

/* Main function to start parsing */
int main() {
    printf("Enter expressions (e.g., 5 + 3 - 2). Press Ctrl+D to exit:\n");
    yyparse();
    return 0;
}

%{
#include <stdio.h>
#include <stdlib.h>

// Declare external functions to prevent compiler warnings
int yylex(void);
int yyerror(const char *s);
%}

%token WORD NUMBER STOP

%define parse.error verbose

%%

start : WORD list STOP { printf("Input ok!\n"); } ;

list : thing list | %empty;

thing : WORD | NUMBER ;

%%

int main(void) {
    yyparse();
}

int yyerror(char *s) {
    printf("Fail: %s\n", s);
}

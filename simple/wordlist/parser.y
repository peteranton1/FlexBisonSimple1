%{
#include <stdio.h>
#include <stdlib.h>

// Declare external functions to prevent compiler warnings
int yylex(void);
void yyerror(const char *s);
%}

%token WORD NUMBER STOP

%define parse.error verbose

%%

start : WORD list STOP { printf("Input ok!\n"); } ;

list : thing list | %empty;

thing : WORD | NUMBER ;

%%

int main(void) {
    printf("Enter words and numbers followed by . \nPress Ctrl+D to exit:\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    printf("Fail: %s\n", s);
}

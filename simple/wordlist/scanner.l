%{
#include "parser.tab.h"
%}

%%

[a-z]+ { return WORD; }
[0-9]+ { return NUMBER; }
\. { return STOP; }

%%

int yywrap() {
    return 1;
}

%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
#include "token.h"

char *lexema;
%}

DIGITO      [0-9]
INT         {DIGITO}+
REAL        {DIGITO}+"."{DIGITO}+

%%

{REAL} {
    lexema = yytext;
    return NUM;
}

{INT} {
    lexema = yytext;
    return NUM;
}

"+"     { return PLUS; }
"-"     { return MINUS; }
"*"     { return TIMES; }
"/"     { return DIV; }

\n      { return EOL; }

[ \t]   { /*Ignora os espaços*/ }

. { /*Qualquer caracter que não foi mapeado*/
    return ERROR;
}

%%
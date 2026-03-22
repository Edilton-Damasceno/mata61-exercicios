#include <stdio.h>
#include "token.h"

extern int yylex();
extern char *lexema;

int main() {
    int token;

    while ((token = yylex()) != EOL) {
        switch (token) {
            case NUM:
                printf("categoria do token: %d, constante numérica: %s\n", token, lexema);
                break;

            case PLUS:
            case MINUS:
            case TIMES:
            case DIV:
                printf("categoria do token: %d\n", token);
                break;

            case ERROR:
                printf("erro léxico: caractere inválido\n");
                break;
        }
    }

    return 0;
}
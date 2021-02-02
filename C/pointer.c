#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>
#include <string.h>
#include <time.h>

int main() {
    /*
     * An already existing variable can be dereferenced into a pointer with an asterisk (*), which means its
     * absolute address becomes a new pointer *variable, and dereferencing a pointer returns the value stored on it.
     * For instance:
     * int var = 7;
     * int *pVar = &var; (pointer gets var's address)
     * printf("%p: %d\n", pVar, *pVar); ("address": 7)
     */

    int tuna = 19;

    printf("Variable\tValue\tAdress\n");
    printf("%s\t\t%d\t%p\n", "tuna", tuna, &tuna);

    int *pTuna = &tuna;

    printf("%s\t\t%d\t%p\n", "tuna", tuna, pTuna);
    printf("%s\t\t%p\t%p\n", "pTuna", pTuna, &pTuna);

    *pTuna = 71;
    
    printf("Tuna: %d\n", tuna);
    printf("pTuna: %d\n", *pTuna);

    return 0;
}

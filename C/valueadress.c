#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>
#include <string.h>
#include <time.h>

void passByValue(int i) {
    i = 99;
    return;
}

void passByAddress(int *i) {
    *i = 64;
    return;
}

int main() {
    int tuna = 20;
    passByValue(tuna); // Same as passByValue(20);
    printf("Passing by value, tuna is now: %d\n", tuna);
    passByAddress(&tuna); // Actually changes the variable's value
    printf("Passing by address, tuna is now: %d\n", tuna);

    return 0;
}


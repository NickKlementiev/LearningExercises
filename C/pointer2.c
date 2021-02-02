#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>
#include <string.h>
#include <time.h>

int main() {
    int i;
    int meatBalls[5] = {7, 9, 43, 21, 3};
    
    printf("Element \t Adress \t\t Value\n");
    for (i = 0; i < 5; i++) {
        printf("meatBalls[%d] \t %p \t %d\n", i, &meatBalls[i], meatBalls[i]);
    }

    printf("\nmeatBalls \t %p \t %d   <<< points to first element of array\n", meatBalls, *meatBalls);
    printf("*(meatBalls+2) \t %p \t %d  <<< points to third element of array\n", meatBalls, *(meatBalls + 2));

    return 0;
}

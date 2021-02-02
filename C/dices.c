#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <math.h>
#include <time.h>

int main() {
    int diceA, diceB, diceC;
    int sumA, sumB;
    char answer;

    /* Random generates a pseudo-random number with a specific seed set by srand()
     * to make it completely random, you have to set the seed as time(NULL), so it generates
     * a random time number everytime
     */
    srand(time(NULL));

    diceA = (rand() % 6) + 1;
    diceB = (rand() % 6) + 1;
    diceC = (rand() % 6) + 1;
    sumA = diceA + diceB + diceC;

    printf("%d, %d, %d\n", diceA, diceB, diceC);

    printf("Total of three dices together: %i\n", sumA);
    printf("Will the next roll of dices be [h]igher, [l]ower or the [s]ame as the first?\n> ");
    scanf("%c", &answer);

    diceA = (rand() % 6) + 1;
    diceB = (rand() % 6) + 1;
    diceC = (rand() % 6) + 1;
    sumB = diceA + diceB + diceC;

    printf("%d, %d, %d\n", diceA, diceB, diceC);

    switch (answer) {
        case 'h':
            if (sumB > sumA)
                printf("You are a winner!\n");
            else
                printf("Oh no, you lost!\n");
            break;
        case 'l':
            if (sumB < sumA)
                printf("You are a winner!\n");
            else
                printf("Oh no, you lost!\n");
            break;
        case 's':
            if (sumB == sumA)
                printf("You are a winner!\n");
            else
                printf("Oh no, you lost!\n");
            break;
        default:
            printf("Oops, invalid answer!\n");
            break;
    }

    printf("Second roll: %i\n", sumB);

    return 0;
}

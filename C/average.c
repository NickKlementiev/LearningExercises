#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>
#include <string.h>
#include <time.h>


int main() {
    int i, howMany;
    int total = 0;
    float average = 0.0;
    int *pointsArray;

    printf("How many numbers do you want to average?\n> ");
    scanf("%d", &howMany);

    pointsArray = (int *) malloc(howMany * sizeof(int));

    printf("Input them below:\n");

    for (i = 0; i < howMany; i++) {
        printf("Number %d: > ", i + 1);
        scanf("%d", &pointsArray[i]);
        total += pointsArray[i];
    }

    average = (float) total / (float) howMany;
    printf("\nThe average is %.2f\n", average);

    return 0;
}

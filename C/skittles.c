#include <cc50.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>

int main() {
    srand(time(NULL));
    int skittles = rand() % 1024; 
    int entered;
    printf("SKITTLES GENERATED\n\n");

    printf("What is the total number of skittles of the machine?\nTip: between 0 and 1023");
    while (entered != skittles) {
        printf("\n> ");
        entered = GetInt();
        if (entered > 1023 || entered < 0)
            printf("Don't be silly, try again.");
        else if (entered < skittles)
            printf("I have more skittles than that!");
        else if (entered > skittles)
            printf("I have less skittles than that.");
    }
    printf("\nYou are correct! Nhom nhom nhom\n");

    return 0;
}

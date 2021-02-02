#include <cc50.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

/*
 * A credit card number validator and categorizer
 * (doesn't work that well on modern numbers)
 */

int main() {
    long long number, copy;
    int digits, sum;
    bool x = 0;

    printf("Credit card number:");

    while (!x) {
        sum = 0;
        printf("\n> ");
        number = GetLongLong();
        if (number == 0) {
            printf("Cannot be zero. Try again.");
            continue;
        }
        else if (number < 0) {
            printf("Cannot be negative. Try again.");
            continue;
        }
        digits = floor(log10(number)) + 1;
        if (digits < 13 || digits == 14 || digits > 16) {
            printf("Invalid card number. Try again.");
            continue;
        }
        int numArray[digits];
        copy = number;
        for (int i = digits; i >= 0; i--) {
            numArray[i] = copy % 10;
            copy /= 10;
        }
        
        for (int i = 1; i <= digits; i += 2) {
            sum += numArray[i];
        }

        for (int i = 2; i <= digits; i += 2) {
            if (numArray[i] * 2 > 9) {
                sum += 1;
                sum += numArray[i] * 2 - 10;
            }
            else {
                sum += numArray[i] * 2;
            }
        }

        printf("Sum: %i\n", sum);

        if (sum % 10 != 0) {
            printf("Invalid credit number. Try again.");
            continue;
        } else
            printf("Valid credit number.\n");

        if (numArray[1] == 3 && (numArray[2] == 4 || numArray[2] == 7)) {
            printf("AMEX\n");
        }
        else if (numArray[1] == 5 && (numArray[2] > 0 && numArray[2] < 6)) {
            printf("MACA\n");
        }
        else if (numArray[1] == 4) {
            printf("VISA\n");
        }

        x = 1;
    }

    return 0;
}

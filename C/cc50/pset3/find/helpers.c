/**************************************************************************** 
 * helpers.c
 *
 * CC50
 * Pset 3
 *
 * Helper functions for Problem Set 3.
 ***************************************************************************/
       
#include <cc50.h>

#include "helpers.h"

#include <stdio.h>

/*
 * Returns true if value is in array of n values, else false.
 */
int x;

bool 
search(int value, int array[], int n)
{
    // TODO: re-implement as binary search
    /*
     *for (int i = 0; i < n; i++)
     *    if (array[i] == value)
     *        return true;
     *return false;
     */

    sort(array, n);
    if (value <= array[n / 2]) {
        int i = 2;
        while (value < array[n / i]) {
            i++;
        }
        for (int j = 0; j <= n / i; j++)
            if (value == array[j]) return true;
    }
    else if (value > array[n / 2]) {
        int i = 2;
        while (value < array[n - 1] && value > array[(n - 1) - (n / i)])
            i++;
        for (int j = n - 1; j >= (n - 1) - (n / i); j--) {
            if (value == array[j]) return true;
        }
    }
    return false;
}


/*
 * Sorts array of n values.
 */

void 
sort(int values[], int n)
{
    // TODO: implement an O(n^2) sort
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            if ((j + 1) != n && values[j] > values[j + 1]) {
                x = values[j];
                values[j] = values[j + 1];
                values[j + 1] = x;
            }
        }
    }
    return;
}

 int
 main(void)
 {
     int numbers[] = {0, 9, 1, 8, 2, 7, 3, 6, 4, 5};
     sort(numbers, 10);
     for (int i = 0; i < 10; i++) {
         if (i == 9) printf("%d\n", numbers[i]);
         else printf("%d, ", numbers[i]);
     }
     int x;
     printf("Type in a number to search:\n> ");
     scanf("%d", &x);
     if (search(x, numbers, 10))
         printf("Found it\n");
     else
         printf("Lost it\n");

     return 0;
 }

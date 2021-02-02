#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Sorting the array list[] using MergeSort
// i = initial index, j = final index, aux[] = auxiliary array
void mergesort(int i, int j, int list[], int aux[]) {
    // Don't do anything if the array has one or none elements
    if (j <= i) return;

    // Specify the middle index of the array
    int middle = (i + j) / 2;

    // Use the function with two subarrays:
    // list[a, ..., middle]
    // list[middle + 1, ..., j]
    mergesort(i, middle, list, aux);
    mergesort(middle + 1, j, list, aux);

    // Set the initial values for the two subarrays
    int initialLeft = i;
    int initialRight = middle + 1;

    // For loop from i to j to fill each element of the final array
    for (int k = i; k <= j; k++) {
        // Merging the left subarray in case it's finished
        if (initialLeft == middle + 1) {
            aux[k] = list[initialRight];
            initialRight++;
        }
        // Merging the right subarray in case it's finished
        else if (initialRight == j + 1) {
            aux[k] = list[initialLeft];
            initialLeft++;
        }
        // If none of the two subarrays are finished and if the left pointer is smaller than the right one,
        // put it in the merged array
        else if (list[initialLeft] < list[initialRight]) {
            aux[k] = list[initialLeft];
            initialLeft++;
        }
        // If none of the two subarrays are finished and if the right pointer is smalle than the left one,
        // put it in the merged array
        else {
            aux[k] = list[initialRight];
            initialRight++;
        }
    }

    // For loop that copies the elements from the auxiliar array to the list
    for (int k = i; k <= j; k++) {
        list[k] = aux[k];
    }
}

int main(void) {
    
    //int a[] = { 10, 14, 19, 26, 27, 31, 33, 35, 42, 44, 0 };
    //int a[] = { 16, 6, 4, 3, 10, 15, 8, 15, 15, 4, 10, 7, 8, 13, 19, 6, 5, 1, 14, 16 };
    int a[10] = { 2, 8, 7, 7, 5, 1, 3, 6, 4, 9 };
    int b[10];

//    for (int i = 0; i < 10; i++) {
//        a[i] = rand() % 20;
//    }

    printf("Initial array:\n");
    for (int k = 0; k < 10; k++) {
        if (k == 9)
            printf("%d\n", a[k]);
        else
            printf("%d, ", a[k]);
    }

    clock_t start = clock();

    mergesort(0, 9, a, b);

    clock_t end = clock();

    for (int k = 0; k < 10; k++) {
        if (k == 9)
            printf("%d\n", a[k]);
        else
            printf("%d, ", a[k]);
    }

    printf("\nElapsed time: %f seconds\n", (double) (end - start) / CLOCKS_PER_SEC);

    return 0;
}

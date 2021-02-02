#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <ctype.h>
#include <time.h>

/*
 * Four functions which act as array operators:
 * carregarVetor = loadArray (adds element to array)
 * exibirVetor = viewArray (prints array's elements)
 * somatoriaVetor = sumArray (returns the sum of the given array's elements)
 * mediaVetor = avgArray (returns the average of the given array's elements)
 */

void carregarVetor(int *array, int size) {
    for (int i = 0; i < size; i++) {
        printf("Elemento %d:\n> ", i + 1);
        scanf("%d", &array[i]);
    }
}

void exibirVetor(int *array, int size) {
    for (unsigned int i = 0; i < size; i++) {
        if (i == 0)
            printf("[%d, ", array[i]);
        else if (i == size - 1)
            printf("%d]\n", array[i]);
        else
            printf("%d, ", array[i]);
    }
}

int somatoriaVetor(int *array, int size) {
    int total = 0;
    for (int i = 0; i < size; i++) {
        total += array[i];
    }
    return total;
}

float mediaVetor(int *array, int size) {
    int sum = somatoriaVetor(array, size);
    return sum / (float)size;
}

int main() {
    int size;
    printf("Quantos elementos terá o vetor?\n> ");
    scanf("%d", &size);
    int vet[size];
    carregarVetor(vet, size);
    exibirVetor(vet, size);
    printf("Somatória: %d\n", somatoriaVetor(vet, size));
    printf("Média: %.2f\n", mediaVetor(vet, size));

    return 0;
}

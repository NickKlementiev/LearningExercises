#include <stdio.h>
#include <stdlib.h>

/*
 * QuickSort sample
 */

int partial(int vetor[], int inicio, int fim){
       int pivo = vetor[fim];
       int a, b = inicio;
       for (int i = inicio; i < fim; ++i){
          if (vetor[i] <= pivo) {
             a = vetor[b], vetor[b] = vetor[i], vetor[i] = a;
             ++b; 
          }
       }
       a = vetor[b], vetor[b] = vetor[fim], vetor[fim] = a;
       return b; 
}

void quickSort (int vetor[], int inicio, int fim)
{
   while (inicio < fim) {
      int b = partial (vetor, inicio, fim);
      if (b - inicio < fim - b) {
         quickSort (vetor, inicio, b-1);
         inicio = b + 1;
      } else {
         quickSort (vetor, b+1, fim);
         fim = b - 1;
      }
   }
}

int main(){
    int vetor[] = {5,9,6,8,7,6,2,3,4,3};
    int vetorArrumado[] = {};
    int i;
    int inicio = 0;

    int tam = sizeof(vetor) / sizeof(vetor[0]);
    printf("Tamanho do array é: %d\n", tam);

    int fim = tam-1;
    printf("Tamanho: %d\n", fim);

    quickSort(vetor, inicio, fim);

    for(i = 0; i < 10; i++){
        int n = vetor[i];
        printf("%d\n", n);
    }

    return 0;
}

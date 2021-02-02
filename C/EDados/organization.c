#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// QUICKSORT - START
// quicksort(lista, inicio, fim)

// Função que retorna um valor int que organiza um pedaço parcial da lista
int partial(int vetor[], int inicio, int fim) {
       int pivo = vetor[fim];
       int a, b = inicio;
       for (int i = inicio; i < fim; ++i){
          if (vetor[i] <= pivo) {
             a = vetor[b], vetor[b] = vetor[i], vetor[i] = a;
             b++; 
          }
       }
       a = vetor[b], vetor[b] = vetor[fim], vetor[fim] = a;
       return b; 
}

// Função recursiva quicksort que divide uma dada lista várias vezes, organizando cada pedaço
void quicksort (int vetor[], int inicio, int fim) {
   while (inicio < fim) {
      int b = partial(vetor, inicio, fim);
      if (b - inicio < fim - b) {
         quicksort(vetor, inicio, b-1);
         inicio = b + 1;
      } else {
         quicksort(vetor, b+1, fim);
         fim = b - 1;
      }
   }
}
// QUICKSORT - END

// BUBBLESORT - START
// bubblesort(lista, fim)

// Função que troca os valores de posição
void trocarpos(int v[], int i, int j) {
    int z = v[i];
    v[i] = v[j];
    v[j] = z;
}

// Função bubblesort que itera múltiplas vezes pelo vetor até organizá-lo
void bubblesort(int *v, int size) {
    for (int ult = size; ult > 0; ult--) {
        for (int i = 0; i < ult; i++){
            if (v[i] > v[i+1]) 
                trocarpos(v, i, i +1);
        }
    }
}
// BUBBLESORT - END

// MERGESORT - START
// mergesort(inicio, fim, lista, auxiliar)

// Função recursiva mergesort que divide pela metade múltiplas vezes e junta tudo ao final da organização
void mergesort(int i, int j, int list[], int aux[]) {
    if (j <= i) return;

    int middle = (i + j) / 2;

    mergesort(i, middle, list, aux);
    mergesort(middle + 1, j, list, aux);

    int initialLeft = i;
    int initialRight = middle + 1;

    for (int k = i; k <= j; k++) {
        if (initialLeft == middle + 1) {
            aux[k] = list[initialRight];
            initialRight++;
        }
        else if (initialRight == j + 1) {
            aux[k] = list[initialLeft];
            initialLeft++;
        }
        else if (list[initialLeft] < list[initialRight]) {
            aux[k] = list[initialLeft];
            initialLeft++;
        }
        else {
            aux[k] = list[initialRight];
            initialRight++;
        }
    }

    for (int k = i; k <= j; k++) {
        list[k] = aux[k];
    }
}
// MERGESORT - END

// Função que copia os conteúdos do arquivo dado para uma lista estática
void filetoarray(FILE *pFile, char *file, int *array, int size) {
    pFile = fopen(file, "r");

    while (!feof(pFile)) {
        for (int i = 0; i < size; i++) {
            fscanf(pFile, "%d", &array[i]);
        }
    }

    fclose(pFile);
}

int main() {
    FILE *pFile;
    char ch;
    int lines = 0;

    pFile = fopen("lista.txt", "r");
    
    // Faz a conferência em caso de os arquivos não existirem
    if (pFile == NULL) {
        printf("Arquivos externos não encontrados\n");
        printf("Certifique-se de ter executado o programa de creation.c primeiramente\n");
        return -1;
    }

    // Faz a contagem de linhas para instanciar a lista estática
    while ((ch = fgetc(pFile)) != EOF) {
        if (ch == '\n')
            lines++;
    }

    fclose(pFile);

    // Criação de duas listas, a original e a auxiliar
    int array[lines], aux[lines];

    printf("100%% desordenada\n");
    // Preencher a lista com os valores
    filetoarray(pFile, "lista.txt", array, lines);

    // Organização com o tempo de execução
    clock_t begin = clock();
    mergesort(0, lines - 1, array, aux);
    clock_t end = clock();


    printf("Tempo decorrido (MergeSort): %f segundos\n", (double) (end - begin) / CLOCKS_PER_SEC);

    filetoarray(pFile, "lista.txt", array, lines);

    begin = clock();
    quicksort(array, 0, lines - 1);
    end = clock();

    printf("Tempo decorrido (QuickSort): %f segundos\n", (double) (end - begin) / CLOCKS_PER_SEC);

    filetoarray(pFile, "lista.txt", array, lines);

    begin = clock();
    bubblesort(array, lines - 1);
    end = clock();

    printf("Tempo decorrido (BubbleSort): %f segundos\n", (double) (end - begin) / CLOCKS_PER_SEC);

    printf("\n75%% desordenada\n");
    filetoarray(pFile, "lista25.txt", array, lines);

    begin = clock();
    mergesort(0, lines - 1, array, aux);
    end = clock();


    printf("Tempo decorrido (MergeSort): %f segundos\n", (double) (end - begin) / CLOCKS_PER_SEC);

    filetoarray(pFile, "lista25.txt", array, lines);

    begin = clock();
    quicksort(array, 0, lines - 1);
    end = clock();

    printf("Tempo decorrido (QuickSort): %f segundos\n", (double) (end - begin) / CLOCKS_PER_SEC);

    filetoarray(pFile, "lista25.txt", array, lines);

    begin = clock();
    bubblesort(array, lines - 1);
    end = clock();

    printf("Tempo decorrido (BubbleSort): %f segundos\n", (double) (end - begin) / CLOCKS_PER_SEC);

    printf("\n50%% desordenada\n");
    filetoarray(pFile, "lista50.txt", array, lines);

    begin = clock();
    mergesort(0, lines - 1, array, aux);
    end = clock();


    printf("Tempo decorrido (MergeSort): %f segundos\n", (double) (end - begin) / CLOCKS_PER_SEC);

    filetoarray(pFile, "lista50.txt", array, lines);

    begin = clock();
    quicksort(array, 0, lines - 1);
    end = clock();

    printf("Tempo decorrido (QuickSort): %f segundos\n", (double) (end - begin) / CLOCKS_PER_SEC);

    filetoarray(pFile, "lista50.txt", array, lines);

    begin = clock();
    bubblesort(array, lines - 1);
    end = clock();

    printf("Tempo decorrido (BubbleSort): %f segundos\n", (double) (end - begin) / CLOCKS_PER_SEC);

    pFile = fopen("ordenado.txt", "w");

    for (int i = 0; i < lines; i++)
        fprintf(pFile, "%d\n", array[i]);

    fclose(pFile);

    return 0;
}

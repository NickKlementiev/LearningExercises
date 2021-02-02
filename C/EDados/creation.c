#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Função que realiza o método MergeSort
void mergesort(int i, int j, int *array, int *aux) {
    if (j <= i) return;

    int middle = (i + j) / 2;

    mergesort(i, middle, array, aux);
    mergesort(middle + 1, j, array, aux);

    int left_pointer = i;
    int right_pointer = middle + 1;

    for (int k = i; k <= j; k++) {
        if (left_pointer == middle + 1) {
            aux[k] = array[right_pointer];
            right_pointer++;
        }
        else if (right_pointer == j + 1) {
            aux[k] = array[left_pointer];
            left_pointer++;
        }
        else if (array[left_pointer] < array[right_pointer]) {
            aux[k] = array[left_pointer];
            left_pointer++;
        }
        else {
            aux[k] = array[right_pointer];
            right_pointer++;
        }
    }

    for (int k = i; k <= j; k++) {
        array[k] = aux[k];
    }
}

int main(void) {
    // Configurar a seed da função rand() para ficar verdadeiramente aleatório
    srand(time(NULL));

    // Variáveis de tamanho
    int size = 10000;

    printf("--Programa gerador de listas aleatórias--\n\n");

    printf("Serão geradas listas com diferentes taxas de aleatoriedade\n");
    printf("em três arquivos externos: lista.txt, lista25.txt, lista50.txt,\n");
    printf("onde, respectivamente, haverá a lista 100%% aleatória, 75%% aleatória e 50%% aleatória.\n\n");

    printf("O tamanho padrão da lista gerada é %d\n", size);
    printf("Deseja alterar o tamanho? [S/N]\n> ");

    char choice;
    scanf("%c", &choice);

    if (choice == 'S' || choice == 's') {
        int counter;
        while (counter < 10) {
            printf("Entre com o tamanho (mín: 10000 e máx: 100000):\n> ");
            scanf("%i", &size);
            if (size >= 10000 && size <= 100000) break;
            else printf("O número inserido está fora do intervalo permitido, tente novamente\n");
            counter++;
        }
        if (counter == 10) {
            printf("O limite de entradas foi atingido, será utilizado o valor padrão de tamanho.\n");
            size = 10000;
        }
    }

    int size50 = size / 2;
    int size25 = size / 4;

    // Declaração dos arrays utilizados no código
    int list[size], list25[size], list50[size], copy[size];

    // Ponteiro de manipulação de arquivos
    FILE *pFile = fopen("lista.txt", "w");

    // Loop que seta todos os valores da lista original list, iguala a lista copy a list e gera o arquivo
    for (int i = 0; i < size; i++) {
        list[i] = rand() % 100001 + 100000;
        copy[i] = list[i];
        fprintf(pFile, "%d\n", list[i]);
    }

    fclose(pFile);

    pFile = fopen("lista50.txt", "w");

    // Loop que imprime o array list original
    //printf("Initial array: ");
    //for (int i = 0; i < 20; i++) {
    //    if (i == 19) printf("%d\n", list[i]);
    //    else printf("%d, ", list[i]);
    //}

    // Utilização do MergeSort para a primeira metade do array list
    mergesort(0, size50 - 1, list, list50);

    // Imprime apenas os elementos ordenados
    //printf("Arranged partial array (50%%): ");
    //for (int i = 0; i < 10; i++) {
    //    if (i == 9) printf("%d\n", list[i]);
    //    else printf("%d, ", list[i]);
    //}

    // Realteração do array list50 de forma que a primeira metade ordenada esteja intercalada entre os
    // elementos não ordenados
    for (int i = 0, k = 0; i < size; i++) {
        if (i == 0 || i % 2 == 0)
            list50[i] = copy[k + size50];
        else {
            list50[i] = list[k];
            k++;
        }
    }

    for (int i = 0; i < size; i++) {
        fprintf(pFile, "%d\n", list50[i]);
    }

    fclose(pFile);

    pFile = fopen("lista25.txt", "w");

    // Imprime o array list50 com 50% dos elementos da list ordenados
    //printf("Arranged array (50%%): ");
    //for (int i = 0; i < 20; i++) {
    //    if (i == 19) printf("%d\n", list50[i]);
    //    else printf("%d, ", list50[i]);
    //}

    // Reiguala a lista list ao que era antes do MergeSort
    for (int i = 0; i < size; i++)
        list[i] = copy[i];
    
    // MergeSort para o primeiro quarto da lista
    mergesort(0, size25 - 1, list, list25);

    // Realteração do array list25 de forma que o primeiro quarto ordenado esteja intercalado entre os
    // elementos não ordenados
    for (int i = 0, k = 0; i < size; i++) {
        if (i < size25 * 2) {
            if (i == 0 || i % 2 == 0)
                list25[i] = copy[k + size25];
            else {
                list25[i] = list[k];
                k++;
            }
        }
        else {
            list25[i] = copy[k + size25];
            k++;
        }
    }

    for (int i = 0; i < size; i++) {
        fprintf(pFile, "%d\n", list25[i]);
    }

    // Imprime apenas os elementos ordenados
    //printf("Arranged partial array (25%%): ");
    //for (int i = 0; i < 4; i++) {
    //    if (i == 3) printf("%d\n", list[i]);
    //    else printf("%d, ", list[i]);
    //}

    // Imprime o array inteiro list25 com 25% de ordenação
    //printf("Arranged array (25%%): ");
    //for (int i = 0; i < 20; i++) {
    //    if (i == 19) printf("%d\n", list25[i]);
    //    else printf("%d, ", list25[i]);
    //}

    fclose(pFile);

    printf("\nListas geradas com sucesso\n");
    return 0;
}

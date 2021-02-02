#include <stdio.h>
#include <stdlib.h>

/*
 * Function named "pesquisar" for searching for a number inside a static array
 * being n the size of the array and num the number it's supposed to look for
 */

int pesquisar(int vetor[], int n, int num) {
    int resposta = -1;
    for (int i = 0; i < n; i++) {
        if (vetor[i] == num) {
            resposta = i;
            n = i;
        }
    }
    return resposta;
}

int main() {
    int v[] = {20, 15, 30, 80, 50, 45, 75, 32, 10, 5};
    
    printf("%i\n", pesquisar(v, 10, 15));
    printf("%i\n", pesquisar(v, 10, 32));
    printf("%i\n", pesquisar(v, 10, 91));
    

    return 0;
}

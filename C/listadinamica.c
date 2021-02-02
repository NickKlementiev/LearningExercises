#include <stdio.h>
#include <stdlib.h>

/*
 * Dynamic array using malloc and a node struct named "no" as in "nó" in Portuguese
 * With some operation functions, such as:
 * inserir = insert
 * exibir = view
 * remover = remove
 */

// Estrutura nó responsável por delimitar a lista dinâmica recursivamente
struct no {
    int info;
    struct no *prox;
};

// Instanciação da lista dinâmica, que aponta para a estrutura nó
struct no *lista = NULL;
struct no *ultimo;

void inserir(int nr, struct no *plista) {
    struct no *novo;
    novo = (struct no *) malloc(sizeof(struct no));
    novo->info = nr;
    novo->prox = NULL;
    if (plista == NULL) {
        lista = novo;
    }
    else {
        ultimo->prox = novo;
    }
    ultimo = novo;
};

void exibir(struct no *plista) {
    if (plista != NULL) {
        printf("[%x] %d -> %x\n", plista, plista->info, plista->prox);
        exibir(plista->prox);
    }
}

void remover(int nr, struct no *plista) {
    struct no *aux = plista;
    struct no *ant;
    if (plista != NULL) {
        if (aux->info == nr) {
            lista = aux->prox;
            free(aux);
        }
        else {
            while (aux != NULL && aux->info != nr) {
                ant = aux;
                aux = aux->prox;
            }
            if (aux != NULL) {
                ant->prox = aux->prox;
                if (aux == ultimo) {
                    ultimo = ant;
                }
                free(aux);
            } else {
                printf("Não existe o número na lista\n");
            }
        }
    
    }
}

int main() {
    inserir(10, lista);
    inserir(20, lista);
    inserir(30, lista);
    inserir(40, lista);
    inserir(91, lista);
    exibir(lista);
    remover(91, lista);
    exibir(lista);
    remover(23, lista);
    exibir(lista);
    puts("");
    remover(10, lista);
    exibir(lista);
    //remover(20, lista);
    //remover(30, lista);
    //remover(40, lista);

    return 0;
};

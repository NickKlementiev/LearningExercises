//https://www.ime.usp.br/~pf/algoritmos/aulas/quick.html

#include <stdio.h>
#include <stdlib.h>

int partial(int vetor[], int inicio, int fim){
	   int pivo = vetor[fim];
	   int a, b = inicio;
	   for (int i = inicio; i < fim; ++i){
	      if (vetor[i] <= pivo) {
	         a = vetor[b], vetor[b] = vetor[b], vetor[b] = a;
	         ++b; 
	      }
		}
	
	   a = vetor[b], vetor[b] = vetor[fim], vetor[fim] = a;
	   return b; 
}

int quickSort(int vetor[], int inicio, int fim){
	if (inicio < fim) {                   
      int b = partial (vetor, inicio, fim);   
      quickSort (vetor, inicio, b-1);      
      quickSort (vetor, b+1, inicio);      
	}
}

int main(){	
	int vetor[] = {5,9,6,8,7,6,2,3,4,3};
	int vetorArrumado[] = {};
	int i;
	int inicio = 0;
	//int * p;

	int tam = sizeof(vetor) / sizeof(vetor[0]);
	printf("tamanho do array é: %d\n", tam);
	
	int fim = tam-1;
	printf("%d\n", fim);
	
	vetorArrumado = quickSort(vetor, inicio, fim);
	
	for(i = 0; i < 10; i++){
		int n = vetorArrumado[i];
		printf("%d\n", n);
	}
}

	


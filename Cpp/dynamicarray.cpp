#include <cstddef>
#include <iostream>

// Using class std for string formatting
using namespace std;

/*
 * This is another university project we made; it uses two different
 * array types (stack and array) which act differently towards the
 * newly and oldly inserted elements
 */

/* Explicação de como PILHA e FILA funcionam neste programa */

// PILHA: supondo uma lista de 3 elementos colocados em sequência: a, b, c
// A lista seria impressa como: c, b, a, sendo a o primeiro elemento da pilha e c, o último
// A remoção do último elemento seria feito pela esquerda, então c seria eliminado: b, a
// A inserção de um novo elemento d também seria feito pela esquerda, então ficaria: d, b, a

// FILA: supondo os mesmos elementos colocados em sequência: a, b, c
// A fila seria impressa como: a, b, c, sendo a o primeiro elemento da fila e c, o último
// A remoção do último elemento seria feito pela esquerda, então a seria eliminado: b, c
// A inserção de um novo elemento d, porém, seria feito pela direita, então ficaria: b, c, d

// Tipo enum que armazena dois tipos: PILHA e FILA para identificação da lista
enum Variant { PILHA, FILA };

// Template que permite especificar o tipo de dado a ser utilizado na classe
// DynamicArray<TipoDoDado> listaExemplo
template <class Anytype>
class DynamicArray {
    private:
        Anytype *list;
        int maxSize;
        int length;
        Variant variant;
    public:
        // Método construtor que faz a configuração inicial
        DynamicArray(Variant variant) {
            maxSize = 1;
            // new é equivalente a malloc() C
            list = new Anytype[maxSize];
            length = 0;
            setVariant(variant);
        }

        void add(Anytype item) {
            if (this->variant == FILA) {
                if (isFull()) {
                    // Aumenta o tamanho máximo da lista
                    maxSize += 2;

                    // Cria uma nova lista temporária de tamanho maxSize + 2
                    Anytype *tempList = new Anytype[maxSize + 2];

                    // Copia o conteúdo da lista original para a temporária
                    for (int i = 0; i < length; i++) {
                        tempList[i] = list[i];
                    }

                    // delete é equivalente a free() em C
                    delete [] list;

                    // Recria a lista
                    list = tempList;
                }

                // Adiciona o item ao final da lista
                list[length] = item;

            }
            else {
                // Aqui não utilizamos a cláusula if (isFull()), pois é obrigatório recriar a lista principal
                maxSize += 2;
                Anytype *tempList = new Anytype[maxSize + 2];

                // Primeiro elemento como zero para ser substituido posteriormente
                tempList[0] = 0;

                // Copiar a lista para os elementos sucessores do zero inicial
                for (int i = 0; i < length; i++)
                    tempList[i + 1] = list[i];

                delete [] list;
                list = tempList;

                // Ao início, igualar o zero inicial ao item adicionado
                list[0] = item;
            }
            // Aumenta o tamanho da lista
            length++;
        }

        // Remove o elemento inicial em ambos os casos (PILHA e FILA)
        void remove() {
            Anytype *tempList = new Anytype[maxSize];
            for (int i = 1; i < length; i++) {
                tempList[i - 1] = list[i];
            }
            delete [] list;
            list = tempList;
            length--;
        }

        // Imprime os elementos da lista entre vírgulas
        void print() {
            for (int i = 0; i < length; i++) {
                if (i == length - 1) cout << list[i] << endl;
                else cout << list[i] << ", ";
            }
        }

        // Método set para a variante da lista
        void setVariant(Variant variant) {
            this->variant = variant;
        }

        // Verificação para caso a lista esteja cheia
        bool isFull() {
            return length == maxSize;
        }

        // Método get para o tamanho atual da lista
        int getLength() {
            return length;
        }

        // Método get para o tamanho máximo da lista
        int getMaxSize() {
            return maxSize;
        }

        // Método desconstrutivo que libera o espaço da lista ao final do programa
        // ou ao deletar objetos da classe DynamicArray
        ~DynamicArray() {
            delete [] list;
        }
};

int main(void) {
    DynamicArray<int> pilha(PILHA);
    for (int i = 0; i < 20; i++)
        pilha.add(i);
    cout << "PILHA:" << endl;
    pilha.print();
    cout << "Removendo um elemento: " << endl;
    pilha.remove();
    pilha.print();
    cout << "Adicionando 300 à pilha:" << endl;
    pilha.add(300);
    pilha.print();

    cout << endl;

    DynamicArray<int> fila(FILA);
    for (int i = 0; i < 20; i++)
        fila.add(i);
    cout << "FILA: " << endl;
    fila.print();
    cout << "Removendo um elemento: " << endl;
    fila.remove();
    fila.print();
    cout << "Adicionando 300 à fila:" << endl;
    fila.add(300);
    fila.print();

    return 0;
}

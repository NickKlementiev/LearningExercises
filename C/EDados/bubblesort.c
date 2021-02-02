#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int v[20];

void trocarPos(int v[], int i, int j){
    int z = v[i];
    v[i] = v[j];
    v[j] = z;
}

void metodoBolha(int v[]) {
    for (int ult = 19; ult > 0; ult--){
        for (int i = 0; i < ult; i++){
            if (v[i] > v[i+1]) {
                trocarPos(v, i, i +1);
            }
        }
    }
}

int main() {
    srand(time(NULL));
    for (int i = 0; i < 20; i++){
        v[i] = rand() % 100;
    }
    for (int i = 0; i < 20; i++) {
        if (i == 19) {
            printf("%d\n", v[i]);
        }
        else {
            printf("%d, ", v[i]);
        }
    }
    metodoBolha(v);
    for (int i = 0; i < 20; i++) {
        if (i == 19) {
            printf("%d\n", v[i]);
        }
        else {
            printf("%d, ", v[i]);
        }
    }
    return 0;
}

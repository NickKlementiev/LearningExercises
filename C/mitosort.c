#include <stdio.h>
#include <stdlib.h>

int v[] = {85, 12, 40, 30, 20, 19, 32, 94, 75, 29, 57, 84, 22};

void trocarPos(int v[], int i, int j){
    int z = v[i];
    v[i] = v[j];
    v[j] = z;
}

void metodoBolha(int v[]) {
    for (int ult = 12; ult > 0; ult--){
        for (int i = 0; i < ult; i++){
            if (v[i] > v[i+1]) {
                trocarPos(v, i, i +1);
            }
        }
    }
}

int main() {
    metodoBolha(v);
    for (int i = 0; i < 13; i++) {
        if (i == 12) {
            printf("%d\n", v[i]);
        }
        else {
            printf("%d, ", v[i]);
        }
    }
    return 0;
}

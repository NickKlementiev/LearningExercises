#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int
main(void) {
    for (int garrafas = 10; garrafas > 0; garrafas--) {
        char str[] = "nenhuma";
        if (garrafas > 1)
            sprintf(str, "%d", garrafas - 1);
        printf("%d garrafas de cerveja no muro, bebo uma, jogo no lixo, %s %s no muro...\n",
                garrafas, str, (garrafas <= 2 ? "garrafa" : "garrafas"));
    }

    return 0;
}

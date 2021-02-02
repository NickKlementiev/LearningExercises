#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <cc50.h>


int
main(int argc, char *argv[]) {
    if (argv[1] == NULL) {
        printf("O programa requer um argumento para funcionar.\n");
        printf("Exemplo: caesar *numero*\n");
        return 1;
    }

    int k = atoi(argv[1]);

    if (argc != 2 || k == 0) {
        printf("Argumentos inapropriados\nCertifique-se de que seu argumento seja apenas um número natural\n");
        return 1;
    }

    char input[200], crypto[200];

    printf("Digite uma frase de até 200 caracteres:\n> ");
    scanf("%[^\n]", input);

    for (size_t i = 0; i < strlen(input); i++) {
        int current = (int) input[i], cypher;
        if (current == 32) crypto[i] = current;
        else if (current >= 97 && current <= 122) {
            cypher = (current + k) % 97;
            crypto[i] = cypher > 25 ? cypher + 71 : cypher + 97;
        }
        else if (current >= 65 && current <= 90) {
            cypher = (current + k) % 65;
            crypto[i] = cypher > 25 ? cypher + 39 : cypher + 65;
        }
    }
    printf("  %s\n", crypto);
    return 0;
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int isletter(char element) {
    int ascii = (int) element;
    return (ascii >= 65 && ascii <= 90) || (ascii >= 97 && ascii <= 122);
};

int
main(int argc, char *argv[])
{
    if (argv[1] == NULL) {
        printf("Usage: vigenere *keyword*\n");
        return 1;
    }

    char *k = argv[1];

    for (int i = 0; i < strlen(k); i++) {
        if (!isletter(k[i])) {
            printf("Keyword must be only one word, with upper or lower case letters\nand without special symbols\n");
            return 1;
        }
    }

    char input[200], encrypted[200];
    printf("Type a sentence to be encryted (200 chars max):\n> ");
    scanf("%[^\n]", input);

    for (int i = 0, j = 0; i < strlen(input); i++) {
        if (isletter(input[i])) {
            int current = (int) input[i], key = (int) k[j] < 95 ? (int) k[j] - 65 : (int) k[j] - 97, cypher;
            if (current >= 97 && current <= 122) {
                cypher = (current + key) % 97;
                encrypted[i] = cypher > 25 ? cypher + 71 : cypher + 97;
            }
            else if (current >= 65 && current <= 90) {
                cypher = (current + key) % 65;
                encrypted[i] = cypher > 25 ? cypher + 39 : cypher + 65;
            }
            j++;
            if (j == strlen(k)) j = 0;
        } 
        else
            encrypted[i] = input[i];
    }

    printf("  %s\n", encrypted);
    return 0;
}

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>
#include <string.h>

void removeBlank(char string[]) {
    // Removes blank spaces in strings for fgets()
    string[strcspn(string, "\r\n")] = 0;
}

int main() {

    char catsName[50];
    char catsFood[25];
    char sentence[75] = "";


    puts("What's the cat's name?");
    printf("> ");
    fgets(catsName, sizeof(catsName), stdin);
    removeBlank(catsName);

    puts("What does he eat?");
    printf("> ");
    fgets(catsFood, sizeof(catsFood), stdin);
    removeBlank(catsFood);

    strcat(sentence, catsName);
    strcat(sentence, " loves to eat ");
    strcat(sentence, catsFood);

    puts(sentence);
    return 0;

}

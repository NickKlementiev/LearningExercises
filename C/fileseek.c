#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>
#include <string.h>
#include <time.h>

int main() {
    FILE *pFile;
    pFile = fopen("bacon.txt", "w+");

    fputs("I ate 3 pumpkins today\n", pFile);

    // SEEK_SET = beginning of file
    // SEEK_END = end of file
    // fseek means to start writing/reading from a specific position on the file
    fseek(pFile, 7, SEEK_SET);
    fputs(" munchkins on Friday\n", pFile);

    fseek(pFile, -7, SEEK_END);
    fputs("top of a mountain\n", pFile);

    fclose(pFile);
}

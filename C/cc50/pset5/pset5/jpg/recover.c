#include <stdio.h>
#include <stdint.h>

typedef uint8_t BYTE;

int 
main(void) {
    BYTE BLOCK[512];
    FILE *card = fopen("card.raw", "r");
    FILE *jpg;
    int count = 0, open = 0;
    char filename[20];
    //int blocks = 0;

    while (fgetc(card) != EOF) {
        fread(BLOCK, sizeof(BLOCK), 1, card);
        for (int i = 0; i < 512; i++) {
            if (BLOCK[i] == 0xff && BLOCK[i + 1] == 0xd8 && BLOCK[i + 2] == 0xff &&
                    (BLOCK[i + 3] == 0xe0 || BLOCK[i + 3] == 0xe1))
            {
                if (!open) {
                    open = 1;
                }
                else {
                    fclose(jpg);
                }
                sprintf(filename, "%d.jpg", count);
                jpg = fopen(filename, "w");
                count++;
            }
            if (open)
                fwrite(&BLOCK[i], sizeof(BYTE), 1, jpg);
        }
    }

    printf("Found %d jpeg images!\n", count);
    fclose(card);

    return 0;
}

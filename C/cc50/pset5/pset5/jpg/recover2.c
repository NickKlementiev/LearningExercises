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

    while (fread(BLOCK, sizeof(BLOCK), 1, card) == 1) {
        for (int i = 0; i < 512; i++) {
            if (BLOCK[i] == 0xff && BLOCK[i + 1] == 0xd8 && BLOCK[i + 2] == 0xff &&
                    (BLOCK[i + 3] & 0xf0) == 0xe0)
            {
                if (!open) {
                    sprintf(filename, "%03d.jpg", count);
                    jpg = fopen(filename, "w");
                    open = 1;
                    count++;
                }
            }
            else if (open && BLOCK[i] == 0xff && BLOCK[i + 1] == 0xd9 &&
                    BLOCK[i + 2] == 0x00 && BLOCK[i + 3] == 0x00 &&
                    BLOCK[i + 4] == 0x00 && BLOCK[i + 5] == 0x00) {
                fwrite(&BLOCK[i], sizeof(BYTE), 1, jpg);
                fwrite(&BLOCK[i + 1], sizeof(BYTE), 1, jpg);
                fclose(jpg);
                open = 0;
            }
            if (open)
                fwrite(&BLOCK[i], sizeof(BYTE), 1, jpg);
        }
    }

    printf("Found %d jpeg images!\n", count);
    fclose(card);

    return 0;
}

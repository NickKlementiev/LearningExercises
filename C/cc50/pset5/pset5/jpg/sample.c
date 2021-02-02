#include <stdio.h>
#include <stdint.h>

typedef uint8_t BYTE;
BYTE BLOCK[512];
int found = 0, first = 1, count = 0;
char filename[20];

int
main(void)
{
    FILE *card = fopen("./card.raw", "r");
    FILE *jpg;
    while (fread(BLOCK, sizeof(BLOCK), 1, card) == 1) {
        for (int i = 0; i < 512; i++) {
            if (BLOCK[i] == 0xff && BLOCK[i + 1] == 0xd8 && BLOCK[i + 2] == 0xff &&
                    (BLOCK[i + 3] & 0xf0) == 0xe0) {
                if (first) {
                    sprintf(filename, "%03d.jpg", count);
                    jpg = fopen(filename, "w");
                    fwrite(&BLOCK[i], sizeof(BYTE), 1, jpg);
                    count++;
                    first = 0;
                    found = 1;
                } else {
                    fclose(jpg);
                    sprintf(filename, "%03d.jpg", count);
                    FILE *jpg = fopen(filename, "w");
                    fwrite(&BLOCK[i], sizeof(BYTE), 1, jpg);
                    count++;
                }
            } else {
                if (found) {
                    fwrite(&BLOCK[i], sizeof(BYTE), 1, jpg);
                }
            }
        }
    }
    return 0;
}

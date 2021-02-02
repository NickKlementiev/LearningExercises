#include <stdio.h>

int
main(void)
{
    int list[10];
    FILE *fp = fopen("output.txt", "w");

    for (int i = 0; i < 10; i++)
        list[i] = i;

    for (int i = 0; i < 10; i++)
        fprintf(fp, "%d ", list[i]);

    fclose(fp);

    fp = fopen("output.txt", "r");

    for (int i = 0; i < 10; i++) {
        if (i == 5) {
            fseek(fp, -(sizeof(int) * i), SEEK_CUR);
        }
        printf("%c", fgetc(fp));
    }
    puts("");
    return 0;
}

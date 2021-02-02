#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <math.h>

int main() {
    char password[10];
    char counter = 0;

    printf("PASSWORD SECURITY VERIFIER\n");
    puts("--------------------------");
    printf("Type in a password:\n> ");
    scanf("%s", password);

    for (int i = 0; i < sizeof(password); i++) {
        if (islower(password[i])) {
            continue;
        }
        else if (isupper(password[i])) {
            counter++;
        }
        else if (isdigit(password[i])) {
            counter++;
        }
        else if (isgraph(password[i])) {
            counter++;
        }
    }

    printf("PASSWORD: %s\n", (counter == 3) ? "SAFE" : "UNSAFE");

    return 0;
}

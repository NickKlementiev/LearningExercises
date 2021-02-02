#include <stdio.h>
#include <stdlib.h>

int main() {
    int friends;
    printf("How many friends do you have?\n> ");
    scanf("%i", &friends);

    printf("So you have %d friend%s\n", friends, (friends != 1) ? "s" : "");

/*
 * Quick do-while reminder:
 *
 * do {
 * something(0);
 * } while (condition);
 */

    return 0;
}

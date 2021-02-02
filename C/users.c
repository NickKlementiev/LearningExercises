#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>
#include <string.h>
#include <time.h>
// import struct user from InfoHeader.h
#include "./InfoHeader.h"

int main() {

    struct user bucky;
    struct user emily;

    bucky.userID = 1;
    emily.userID = 2;

    printf("Enter the name of user %d\n> ", bucky.userID);
    scanf("%s", bucky.firstName);
    printf("Enter the name of user %d\n> ", emily.userID);
    scanf("%s", emily.firstName);
    printf("User %d's first name is %s\n", bucky.userID, bucky.firstName);
    printf("User %d's first name is %s\n", emily.userID, emily.firstName);

    return 0;
}

/***************************************************************************
 * generate.c
 *
 * CC50
 * Pset 3
 *
 * Generates pseudorandom numbers in [0,LIMIT), one per line.
 *
 * Usage: generate n [s]
 *
 * where n is number of pseudorandom numbers to print
 * and s is an optional seed
 ***************************************************************************/
       
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define LIMIT 65536

int
main(int argc, char *argv[])
{
    // Verifies if there are one or two arguments on program call
    if (argc != 2 && argc != 3)
    {
        printf("Usage: %s n [s]\n", argv[0]);
        return 1;
    }

    // Converts first argument to an integer
    int n = atoi(argv[1]);

    // If there is a second argument, use it as the random seed
    if (argc == 3)
        srand((unsigned int) atoi(argv[2]));
    else
        srand((unsigned int) time(NULL));

    // For loop to print all of the random values that are less than the LIMIT variable
    for (int i = 0; i < n; i++)
        printf("%d\n", rand() % LIMIT);

    // That's all folks
    return 0;
}

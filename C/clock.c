#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

/*
 * Timer sample
 */

int main(void) {
    
    double spent = 0.0;
    
    clock_t startClock = clock();
    time_t startTime = time(NULL);
    

    for (int i = 0; i < 50; i++)
        printf("Hello, number %d!\n", i);

    clock_t endClock = clock();
    time_t endTime = time(NULL);

    spent += (double) (endClock - startClock) / CLOCKS_PER_SEC;

    printf("Elapsed time (using time): %lo seconds\n", (endTime - startTime));
    printf("Elapsed time (using clock): %f seconds\n", spent);

    return 0;
}

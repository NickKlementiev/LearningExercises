#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <math.h>
#include <string.h>
#include <time.h>

int main() {
    char movie1[] = "The Return of Buckyman!"; // Constant, impossible to change without strcpy()
    puts(movie1);

    char *movie2 = "Bucky is awesome I love ham!"; // Points to string "Bucky is awesome I love ham!"
    puts(movie2);

    movie2 = "New movie title"; // Starts pointing to another string "New movie title"
    puts(movie2);


    return 0;
}

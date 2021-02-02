#include <iostream>

int main() {
    std::string fruits[3];
    fruits[0] = "Orange";
    fruits[1] = "Apple";
    fruits[2] = "Banana";

    for (int i = 0; i < 3; i++)
        std::cout << fruits[i] << std::endl;

    return 0;
}

#include <iostream>

int x = 11;

int main() {
    int x = 22;
    {
        int x = 33;
        std::cout << "Block inside main(): x = " << x << std::endl;
    }
    std::cout << "Inside main(): x = " << x << std::endl;
    std::cout << "Inside main(): ::x = " << ::x << " (global x)" << std::endl;
}

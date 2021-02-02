#include <iostream>

int main() {
    enum Semestre { OUTONO, PRIMAVERA, VERAO };
    enum { I = 1, V = 5, X = 10 };

    Semestre s1 = PRIMAVERA;
    Semestre s2 = OUTONO;
    Semestre s3 = VERAO;
    Semestre s4 = PRIMAVERA;

    int x = I + V;
    
    std::cout << s1 << s2 << s3 << s4 << std::endl; 
    if (s1 == s4) std::cout << "Mesmo semestre." << std::endl;

    std::cout << "x = " << x << std::endl;
    return 0;
}

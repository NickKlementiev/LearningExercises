#include <iostream>

// apply prefix std:: to functions
//using namespace std;

int main() {
    int m, n;
    std::cout << "Insira dois números inteiros:\n> ";
    std::cin  >> m >> n;
    std::cout << "\nm = " << m << " n = " << n << std::endl;

    double x, y, z;
    std::cout << "Insira três números decimais:\n> ";
    std::cin >> x >> y >> z;
    std::cout << "\nx = " << x << " y = " << y << " z = " << z << std::endl;

    char a, b, c;
    std::cout << "Insira três caracteres simples:\n> ";
    std::cin >> a >> b >> c;
    std::cout << "\na = " << a << " b = " << b << " c = " << c << std::endl;
    return 0;
}

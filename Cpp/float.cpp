#include <cfloat>
#include <iostream>

using namespace std;

int main() {
    int fbits = 8 * sizeof(float);
    cout << "Float uses " << fbits << " bits\n" << FLT_MANT_DIG - 1 << " bits for its mantissa\n" << fbits - FLT_MANT_DIG << " bit for its exponent\n" << 1 << " bit for its signal\n" << "to obtain " << FLT_DIG << " sig digits\n" << "with minimum value of " << FLT_MIN << " and maximum value of " << FLT_MAX << endl;
}

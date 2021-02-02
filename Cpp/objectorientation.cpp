#include <iostream>

using namespace std;

class BuckysClass {
    private:
        string name;
    public:
        BuckysClass(string name) {
            setName(name);
        }
        void coolSaying() {
            cout << "preaching to the choir" << endl;
        }
        void setName(string name) {
            this->name = name;
        }
        string getName() {
            return this->name;
        }
};

int main(void) {
    
    BuckysClass buckysObject("Robert Buckyson");
    buckysObject.coolSaying();
    cout << buckysObject.getName() << endl;

    buckysObject.setName("Bucky Robertson");
    cout << buckysObject.getName() << endl;

    BuckysClass buckysObject2("Sally McSalad");
    cout << buckysObject2.getName() << endl;

    return 0;
}

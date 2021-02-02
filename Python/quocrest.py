# coding=UTF-8

N1 = int(input("Enter two numbers:\n> "))
N2 = int(input("> "))

quoc = 0

if N1 < N2:
    resto = N1
elif N1 == N2:
    resto = 0
    quoc = 1
else:
    while (N1 - N2) >= N2:
        N1 -= N2
        quoc += 1
    N1 -= N2
    quoc += 1
    resto = N1
print("Resto: %d" % resto)
print("Quociente: %d" % quoc)
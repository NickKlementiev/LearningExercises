# coding=UTF-8

N = int(input("Type a number:\n> "))
b = 2
p = 0
while True:
    x = 0
    while x < N:
        p = (b + (N / b)) / 2
        b = p
        x += 1
    break
if p == 1.25:
    p = 1.0
print(p)

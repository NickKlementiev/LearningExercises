# coding=UTF-8

N = int(input("Type the number:\n> "))
condition = 0
x = 2
while x < N:
    if N != 2 and N != x:
        if (N % x) == 0:
            condition = 1
    x += 1
if N == 0 or N == 1:
    condition = 1

if condition == 0:
    print("Prime")
elif condition != 0:
    print("Not prime")
# coding=UTF-8

limit = int(input("How many prime numbers to show?\n> "))
primes = []
N = 1
while True:
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
        primes.append(N)
    if N == 1 or N == 2:
        N += 1
    else:
        N += 2
    if N >= limit * 5:
        break

print(primes[:limit])
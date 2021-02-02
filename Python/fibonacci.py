# coding=UTF-8

fibonacci = [0,1]

N = int(input("How many numbers to show in the Fibonacci sequence?\n> "))

x = 0
for x in range(N):
    sum = fibonacci[x] + fibonacci[x + 1]
    fibonacci.append(sum)

print(fibonacci[0:N])
# coding=UTF-8

fibonacci = [0,1]

N = int(input("Type a number to check if it belongs to the Fibonacci sequence:\n> "))

x = 0
while N > fibonacci[-1]:
    sum = fibonacci[x] + fibonacci[x + 1]
    fibonacci.append(sum)
    x += 1

print(fibonacci)

if N in fibonacci: 
    print("The number belongs to the Fibonacci sequence")
else:
    print("The number doesn't belong to the Fibonacci sequence")

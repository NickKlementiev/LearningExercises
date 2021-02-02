#coding=UTF-8

cpf = input("Enter your Physical Person Code (CPF): [XXX.XXX.XXX-XX]\n> ")
split = []
mult1 = 10
mult2 = 11
valid1 = 0
valid2 = 0
sum1 = 0
sum2 = 0

for char in cpf:
    try:
        x = int(char)
        split.append(x)
    except ValueError:
        continue

if len(split) == 11:
    for x in range(len(split) - 2):
        sum1 += split[x] * mult1
        mult1 -= 1
    
    if (sum1 * 10) % 11 == split[9] or (sum1 * 10) % 11 == 10 and split[9] == 0:
        valid1 = 1
    
    for x in range(len(split) - 1):
        sum2 += split[x] * mult2
        mult2 -= 1
    
    if (sum2 * 10) % 11 == split[10] or (sum2 * 10) % 11 == 10 and split[10] == 0:
        valid2 = 1

if valid1 == 1 and valid2 == 1:
    print("Valid CPF")
else:
    print("Invalid CPF")



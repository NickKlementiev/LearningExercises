#coding=UTF-8
import random

faturamento = []

x = 0
for x in range(365):
    faturamento.append(random.randint(1000, 10000))

#print(faturamento)
maior = menor = faturamento[0]

x = 0
for x in range(365):
    if maior < faturamento[x]:
        maior = faturamento[x]
    if menor > faturamento[x]:
        menor = faturamento[x]

print("O maior é", maior, "\nO menor é", menor)

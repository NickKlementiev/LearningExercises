'''Basic calculator'''

valor1 = int(input("Digite um número aqui:\n> "))
valor2 = int(input("Digite outro número aqui:\n> "))

operador = input("Qual operador utilizar?\n[Som]a, [Sub]tração, [M]ultiplicação ou [D]ivisão?\n> ")

if operador.lower() == "som":
    resultado = valor1 + valor2
elif operador.lower() == "sub":
    resultado = valor1 - valor2
elif operador.lower() == "m":
    resultado = valor1 * valor2
elif operador.lower() == "d":
    resultado = valor1 / valor2
else:
    print("Operador inválido")

try:
    print(resultado)
except NameError:
    print("Sem operador não tem calculadora!")

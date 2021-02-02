#coding=UTF-8

x = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, "a", "b", "c", "d", "e", "f"]

y = input("Elements to find in list:\n> ")
z = input("> ")

try:
    y = int(y)
except ValueError:
    pass
try:
    z= int(z)
except ValueError:
    pass

for elem in x:
    if elem == y:
        if x.index(y) < x.index(z):
            print("{}: [{}] FOUND FIRST" . format(x.index(y), y))
        elif x.index(y) >= x.index(z):
            print("{}: [{}] FOUND" . format(x.index(y), y))
    elif elem == z:
        if x.index(z) < x.index(y):
            print("{}: [{}] FOUND FIRST" . format(x.index(z), z))
        elif x.index(z) >= x.index(y):
            print("{}: [{}] FOUND" . format(x.index(z), z))
    else:
        print("{}: [{}]" . format(x.index(elem), elem))

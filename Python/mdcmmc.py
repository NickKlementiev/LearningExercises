#coding=UTF-8

def mdc(x, y):
    if y == 0:
        return x
    elif x > y:
        return mdc(y, x % y)

def mmc(x, y):
    return abs(x * y) / mdc(x, y)

print(mdc(12, 4))
print(mmc(4, 3))

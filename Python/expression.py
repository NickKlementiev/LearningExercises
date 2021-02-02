#coding=UTF-8

expression = "(())"
split_expression = []

for char in expression:
    if char == "(" or char == ")":
        split_expression.append(char)

split_expression2 = split_expression

for elem in split_expression:
    if elem == "(":
        for elem2 in split_expression2:
            if elem2 == ")":
                split_expression.remove(elem)
                split_expression.remove(elem2)

if split_expression[0] == "(" and split_expression[1] == ")" and len(split_expression) == 2:
    print("OK")
else:
    print("ERROR")

#coding=UTF-8

phrase = input("Type a phrase:\n> ")
formatted = phrase.lower()
split = formatted.split(" ")
phrase2 = "".join(split)
reverse = phrase2[::-1]
reverse2 = phrase[::-1]

print(reverse2)
if phrase2 == reverse:
    print("It is a palindrome")
else:
    print("It is not a palindrome")

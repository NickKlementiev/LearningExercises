#coding=UTF-8

phrase = input("Type a phrase:\n> ")
split_phrase = phrase.split(" ")
reverse = split_phrase[::-1]

subst = input("What word would you like to substitute?\n> ")
word = input("Replace with what word?\n> ")

if subst in split_phrase:
    reverse[reverse.index(subst)] = word
    split_phrase = reverse[::-1]
    new_phrase = " ".join(split_phrase)
    print(new_phrase)
else:
    print("This word is not in the string!")


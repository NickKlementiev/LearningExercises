#coding=UTF-8

name = "Atikin"
names1 = ["Atikin", "Bob", "Roger"]
names2 = ["Benny", "Bucky", "Jasper"]

def wordlist(word, array):
    return word in array

print(wordlist(name, names1))
print(wordlist(name, names2))

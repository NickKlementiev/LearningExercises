#coding=UTF-8

sentence = "eu te amo anna"
hidden = []
for char in sentence:
    if char == "" or char == " ":
        hidden.append(" ")
    else:
        hidden.append(char)

print(hidden)
print("".join(hidden))
print("".join(sentence))
print("".join(hidden) == "".join(sentence))

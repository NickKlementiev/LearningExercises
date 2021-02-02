#coding=UTF-8

word = "hello world"
hidden = []
misletters = []
mistakes = 0

for char in word:
    if char == " " or char == "":
        hidden.append(" ")
    else:
        hidden.append("_")

while True:
    print("Word:", " ".join(hidden))
    print("Number of mistakes: {}" . format(mistakes))
    print("Mistaken letters:", " ".join(misletters))
    guess = input("Enter a letter:\n> ")
    guess = guess.lower()
    if guess in word:
        for x in range(len(word)):
            if guess == word[x]:
                hidden[x] = guess
        if ("".join(hidden) == "".join(word)):
            print("Word:", " ".join(hidden))
            print("You won!")
            break
    else:
        misletters.append(guess)
        mistakes += 1
    if mistakes >= 6:
        print("You lost!")
        print("The word was {}" . format(word))
        break
print("End of game!")
        

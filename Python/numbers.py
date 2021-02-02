irregulars = {
        "10": "ten",
        "11": "eleven",
        "12": "twelve",
        "13": "thirteen",
        "14": "fourteen",
        "15": "fifteen",
        "16": "sixteen",
        "17": "seventeen",
        "18": "eighteen",
        "19": "nineteen"
        }
dec = {
        "2": "twenty",
        "3": "thirty",
        "4": "forty",
        "5": "fifty",
        "6": "sixty",
        "7": "seventy",
        "8": "eighty",
        "9": "ninety"
        }
un = {
        "1": "one",
        "2": "two",
        "3": "three",
        "4": "four",
        "5": "five",
        "6": "six",
        "7": "seven",
        "8": "eight",
        "9": "nine"
        }
number = input("Type a number: [0-99]\n> ")
split = []
for alg in number:
    split.append(alg)

if int(number) < 10 and int(number) > 0:
    print("The number is {}" . format(un[split[0]]))
elif int(number) >= 10 and int(number) < 20:
    print("The number is {}" . format(irregulars[number]))
elif int(number) >= 20:
    print("The number is {} {}" . format(dec[split[0]], un[split[1]]))


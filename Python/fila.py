#coding=UTF-8
import time

peopleA = []
peopleB = []
keepA = "yes"

while True:
    print("Choose an option:")
    time.sleep(0.1)
    print("A: Check people in list A")
    time.sleep(0.1)
    print("B: Check people in list B")
    time.sleep(0.1)
    print("C: Add people in list A")
    time.sleep(0.1)
    print("D: Add people in list B")
    time.sleep(0.1)
    print("E: Remove people from list A")
    time.sleep(0.1)
    print("F: Remove people from list B")
    time.sleep(0.1)
    print("Q: Exit the program")
    time.sleep(0.1)
    option = input("> ")
    if option.lower() == "a":
        time.sleep(0.25)
        print("People in list A:", peopleA)
        time.sleep(0.25)
    elif option.lower() == "b":
        time.sleep(0.25)
        print("People in list B:", peopleB)
        time.sleep(0.25)
    elif option.lower() == "c":
        time.sleep(0.25)
        person = input("Type the name to add to the list A:\n> ")
        peopleA.append(person)
        time.sleep(0.25)
    elif option.lower() == "d":
        time.sleep(0.25)
        person = input("Type the name to add to the list B:\n> ")
        peopleB.append(person)
        time.sleep(0.25)
    elif option.lower() == "e":
        time.sleep(0.25)
        person = input("Type the name of who has already been attended in list A:\n> ")
        try:
            peopleA.remove(person)
        except ValueError:
            time.sleep(0.25)
            print("That person is not in list A")
            time.sleep(0.25)
    elif option.lower() == "f":
        person = input("Type the name of who has already been attended in list B:\n> ")
        try:
            peopleB.remove(person)
        except ValueError:
            time.sleep(0.25)
            print("That person is not in list B")
            time.sleep(0.25)
    elif option.lower() == "q":
        break
    else:
        time.sleep(0.25)
        print("Invalid option")
        time.sleep(0.25)


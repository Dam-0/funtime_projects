import random

max_age = 100
min_age = 1

age = random.randint(min_age, max_age)

while True:

    guess = int(input("Guess Age: "))

    if guess < age:
        print("Age is higher")
    
    elif guess > age:
        print("Age is lower")
    
    elif guess == age:
        print("YOU GOT IT")
        break

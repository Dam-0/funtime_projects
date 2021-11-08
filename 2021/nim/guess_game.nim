import std/random
import strutils

randomize()

let
    max_age = 100
    min_age = 1
    age = rand(max_age) + min_age


while true:
    echo "Guess Age"
    let guess = readLine(stdin).parseInt()

    if guess < age:
        echo "Age is higher"

    elif guess > age:
        echo "Age is lower"

    elif guess == age:
        echo "YOU GOT IT"
        break
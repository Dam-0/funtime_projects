package main

import (
	"fmt"
	"math/rand"
	"time"
)

func main() {

	var max_age = 100
	var min_age = 1
	var guess int

	rand.Seed(time.Now().UnixNano())
	var age = rand.Intn(max_age - min_age) + min_age

	for {

		fmt.Print("Guess the age: ")
		fmt.Scanf("%d", &guess)

		if guess > age {
			fmt.Print("Age is lower\n")
		} else if guess < age {
			fmt.Print("Age is higher\n")
		} else {
			fmt.Print("YOU GOT IT\n")
			break
		}
	}
}
// Imports things I need
use std::io;
use rand::Rng;
use std::cmp::Ordering;


fn main() -> io::Result<()> {

    // Allows rng to be varible
    let mut rng = rand::thread_rng();

    // Sets min and max age for guess game (range)
    let max_age = 70;
    let min_age = 20;

    // Generates a random number between set varibles
    let age = rng.gen_range(min_age..=max_age);

    // sets guessess to zero, for end total
    let mut guesses = 0;

    // checks if you min age does not exceed your max
    if  max_age < min_age {
        println!("Check your <age> varibles!");
        // TODO
        // Exit out of program is problem occuers
    }

    // loops for users input
    loop {
        // let guess: Result<u32, _> = input_int("Guess age: ").unwrap(); 
        // Assume that there won't be an error in reading the string
        
        println!("Please input your guess.");

        // creates an INT USER INPUT
        let mut guess = String::new();

        io::stdin()
            .read_line(&mut guess)
            .expect("Failed to read line");

        // Error checks users input for vaild data types
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };

        // Increases guess count everytime loop runs
        guesses += 1;

        // Match case for users guess compared to actual age
        match guess.cmp(&age) {
            Ordering::Less => println!("Age is higher!"),
            Ordering::Greater => println!("Age is lower!"),
            Ordering::Equal => { 
                println!("You guessed the age correctly, It took you {} guess(es) to find the age.", guesses);
                break Ok(())
            }
        }

    }   
}

use std::io;

mod util;

use util::input_int;
use util::input_str;

fn main() -> io::Result<()> {
    loop {
        println!("Choose one of the following
            1. Addition
            2. Subtraction
            3. Multiplication
            4. Division
            5. Exit");

        let user_choice = input_str("> ")?;

        // Todo
        // Add if-statement for exit if 5

        let user_first_num = input_int("Enter first number: ")?;
        let user_second_num = input_int("Enter second Number: ")?;

        // Converting string to integer
        let first_num: i32 = user_first_num.trim().parse().ok().unwrap();

        let second_num: i32 = user_second_num.trim().parse().ok().unwrap();

        match user_choice.as_str() {
            "1" => println!("sum is: {}", first_num + second_num),
            "2" => println!("difference is: {}", first_num - second_num),
            "3" => println!("Multiply is: {}", first_num * second_num),
            "4" => println!("division is: {}", first_num / second_num),
            _ => println!("Choose something valid")
        }
    }
}
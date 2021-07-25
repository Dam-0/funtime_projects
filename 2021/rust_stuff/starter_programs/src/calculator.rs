use std::io;
use std::{i32};

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

        let user_first_num = input_int("Enter first number: ")?;
        let user_second_num = input_int("Enter second Number: ")?;

        // Converting string to integer
        let aint: u32 = user_first_num.trim().parse().ok().expect("test");

        let bint: u32 = user_second_num.trim().parse().ok().expect("test");

        match user_choice.as_str() {
            "1" => println!("sum is: {}", aint + bint),
            "2" => println!("difference is: {}", aint - bint),
            "3" => println!("Multiply is: {}", aint * bint),
            "4" => println!("division is: {}", aint / bint),
            "5" => return Ok(()),
            _ => println!("Choose something valid")
        }
    }
}
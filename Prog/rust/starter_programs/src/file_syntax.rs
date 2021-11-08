use std::io;

mod util;

use util::input;

fn main() -> io::Result<()> {
    println!("Hello, world!");

    let number = 5;
    match number {
        0 => println!("Zero"),
        2 => println!("Two"),

        // {} substitute first varible
        i => println!("Got: {}", i)
    }

    let fruit ="apples";

    if fruit == "apples" {
        println!("Apples is correct")
    }

    let list = [1, 2, 3];

    // & referance to fix sized list / pointer
    let list = &[1, 2, 3];

    // mutable, can add items
    let mut list = vec![1, 2, 3];
    list.push(4);

    println!("List has: {:?}", list);


    let string_referance = "Cannot change";

    // mutable
    let mut string = "apples".to_string();
    string.push_str( " and oranges");
    println!("we have {}", &string);

    print_hello("Damo");
    print_hello("Aido");

    // read user input
    let name = input("What is your name?")?;

    // remove end ; to make it return statement
    println!("Hello, '{}'", name);

    // return statement
    Ok(())  
}

// &str , I dont own it. Just borrowing for this func
fn print_hello(name: &str) {
    println!("Hello {}!", name)
}



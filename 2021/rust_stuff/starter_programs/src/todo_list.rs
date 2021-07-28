use std::io;

mod util;

use util::input_str::input;

fn main() -> io::Result<()> {
    let mut items = Vec::new();
    loop {
        let action = input("What do you want to do?")?;
        match action.as_str() {
            "add" => items.push(input( "Input the item...")?),
            "delete" | "remove" | "del" => {
                let to_remove = input("Input what to remove...")?;
                let mut index = 0;
                while index < items.len() {
                    if items[index] == to_remove {
                        items.remove(index);

                    } else {
                        index += 1;
                    }
                }
            }
            // {:?} debug print
            "view" => println!("{:?}", items),
            "exit" => return Ok(()),
            _ => println!("Thats is an invaild action!")
        }
    }
}
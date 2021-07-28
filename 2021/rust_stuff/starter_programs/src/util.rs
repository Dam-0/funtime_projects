use std::io;

//use std::io::Write;
//std::io::{self, Read};
use std::str::FromStr;

/// # Input from user
/// Get some strings from the user
pub fn input_str(prompt: &str) -> io::Result<String> {
    print!("{}", prompt);
    let mut input_value = String::new();
    io::stdin() //inefficant. Should be using one stdin handle 
        .read_line(&mut input_value)?;
    Ok(input_value.trim().to_string())
}

pub fn input_int<T: FromStr>(prompt: &str) -> io::Result<Result<T, T::Err>> {
    let input = io::stdin();
    let mut str = String::new();
    input.read_line(&mut str)?;
    Ok(str.trim().parse())
}
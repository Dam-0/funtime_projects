use std::io;

/// # Input from user
/// Get some strings from the user
pub fn input_str(prompt: &str) -> io::Result<String> {
    println!("{}", prompt);
    let mut input_value = String::new();
    io::stdin() //inefficant. Should be using one stdin handle 
        .read_line(&mut input_value)?;
    Ok(input_value.trim().to_string())
}

pub fn input_int(prompt: &str) -> io::Result<String> {
    println!("{}", prompt);
    let mut input_value = String::new();
    io::stdin() //inefficant. Should be using one stdin handle 
        .read_line(&mut input_value)?;
    Ok(input_value)
}
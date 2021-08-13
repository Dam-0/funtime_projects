fn main() {
    let max = u32::MAX;
    let mut v: Vec<u32> = Vec::new();

    for _ in 0..max{
       v.push(1);
    }
    println!("vec: {:?}", v);
}
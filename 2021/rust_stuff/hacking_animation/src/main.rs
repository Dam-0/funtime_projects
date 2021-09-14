
extern crate pbr;
extern crate rand;
use pbr::ProgressBar;
use rand::prelude::*;
use std::thread;
use std::time::Duration;
mod menu;


fn bar() {
    let count = 500;
    let mut pb = ProgressBar::new(count);
    pb.format("╢▌▌░╟");
    for _ in 0..count {
        pb.inc();
        let n = thread_rng().gen_range(0..100);
        thread::sleep(Duration::from_millis(n));
    }
    pb.finish_print(&format!("{}: Pull complete", rand_string()));
} 



fn rand_string() -> String {
    let mut v = Vec::new();
    while v.len() < 12 {
        let b = random::<u8>();
        // [0-9a-f]
        if b > 47 && b < 58 || b > 96 && b < 103 {
            v.push(b);
        }
    }
    std::str::from_utf8(&v).unwrap().to_string()
}


fn main() {
    menu::launch();
}
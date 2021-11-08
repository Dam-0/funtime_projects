
extern crate pbr;
extern crate rand;

use std::{thread, time};

use std::convert::TryInto;
use pbr::MultiBar;
use rand::prelude::*;
use num_cpus;
use std::time::Duration;
use crossterm::style::Color;
use std::process::exit;
use terminal_menu::{button, label, menu, mut_menu, run, string};
use std::cmp::min;
use pbr::ProgressBar;

//use indicatif::{ProgressBar, ProgressStyle};

// Creates function that holes the menus
fn launch() {
    // sets var that contains the menu
    let menu = menu(vec![
        label(""),
        label("Password Cracker").colorize(Color::Red),
        label("============="),
        label(""),
        string("Password:", "", false),
        button("crack").colorize(Color::Green),

        label(""),
        button("Exit"),
    ]);

        run(&menu);

        if mut_menu(&menu).canceled() == true {
            exit(0);
        }

        //MAIN PART OF CODE
        let char_num = mut_menu(&menu).selection_value("Password:").len();
        let mut total = 0;

        for i in 1..char_num {
            let num_fact_ex = 8;
            let x = factorial(num_fact_ex);
            total = x + x;
        }
        let num = num_cpus::get();


        if  total <= 7257600 {
            let mb = MultiBar::new();
            for i in 1..num {
                let count = 100 * i;
                let mut pb = mb.create_bar(100);
                thread::spawn(move || {
                    for _ in 0..count {
                        pb.inc();
                        let n = thread_rng().gen_range(0..100);
                        thread::sleep(Duration::from_millis(n));
                    }
                    pb.finish();
                });
            }
        
            mb.listen();
        
            println!("\nCrack Complete\n");
        }


            else if  total <= 18446744073709551615 {
                let mut pb = ProgressBar::new(total);
                pb.format("╢▌▌░╟");

                let ten_millis = time::Duration::from_millis(10);
                let now = time::Instant::now();
                for _ in 0..total {
                    pb.inc();
                    thread::sleep(ten_millis);
                }
                pb.finish_print("done");
            }
                else {
                    println!("OUT OF BOUNDS")
                }
            }  


        


fn factorial(num: u64) -> u64 {
    match num {
        0 => 1,
        1 => 1,
        _ => factorial(num - 1) * num,
    }
}



fn main() {
    launch();

}

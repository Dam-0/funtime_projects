use std::{fmt::Result, str};
use crossterm::{event::DisableMouseCapture, style::Print};
use crossterm::style::Color;
use terminal_menu::{menu, activate, list, label, button, run, mut_menu, scroll, back_button, submenu, string, numeric, wait_for_exit};

use damo_fetch::display_screen;
mod utils;


fn launch() {
    let menu = menu(vec![

        label(""),
        label("GUI Is A Sin").colorize(Color::Red),
        label("============="),
        label(""),

        submenu("Damo Fetch", vec![
            label(""),

            label("Select a package manager"),

            label(""),

            list("Manager", vec!["apt", "dpkg", "dnf", "pacman", "rpm", "xbps"]),

            button("Launch"),

            label(""),
            back_button("back")

        ]),

        submenu("Author Details", vec![
            label("My name damo and im cool"),
            label("Github: https://github.com/dam-0"),
            back_button("back")
        ]),

        submenu("Design Philosophy", vec![
            label("Programme was made"),
            label("to annoy Jake"),
            back_button("back")
        ]),

        label(""),

        button("Exit")

        
    ]);
    while mut_menu(&menu).selected_item_name() != "Exit" {
        run(&menu);

        {
            
            if mut_menu(&menu).get_submenu("Damo Fetch").selected_item_name() == "Launch" {
                display_screen(mut_menu(&menu).get_submenu("Damo Fetch").selection_value("Manager"));
                utils::input_str("");
                print!("{}[2J", 27 as char)
            };
        }
    

    }
}

fn main() {
    launch();
    
}

// Changed Initial Menu
use std::{fmt::Result, str};
use crossterm::{event::DisableMouseCapture, style::Print};
use crossterm::style::Color;
use terminal_menu::{menu, list, label, button, run, mut_menu, scroll, back_button, submenu, string, numeric};
use std::env;


mod damo_fetch;


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
            // button(damo_fetch::display_screen()),

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
    run(&menu);

    

    if mut_menu(&menu).get_submenu("Damo Fetch").selected_item_name() == "Launch" {
        //damo_fetch::display_screen(mut_menu(&menu).get_submenu("Damo Fetch").selection_value("Manager"));
        println!("{}", mut_menu(&menu).get_submenu("Damo Fetch").selection_value("Manager"))
    }

}

fn main() {
    launch();
    
}

// Changed Initial Menu
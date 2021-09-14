use crossterm::style::Color;
use std::process::exit;
use terminal_menu::{
    activate, back_button, button, label, list, menu, mut_menu, numeric, run, scroll, string,
    submenu, wait_for_exit,
};
mod utils;

// Creates function that holes the menus
fn launch() {
    // sets var that contains the menu
    let menu = menu(vec![
        // Creats the title menu
        label(""),
        label("GUI Is A Sin").colorize(Color::Red),
        label("============="),
        label(""),
        // Creats a sub-menu to launch damo_fetch from
        submenu(
            "Damo Fetch",
            vec![
                label(""),
                label("Select a package manager"),
                label(""),
                // Allows user to select appropriate package system for there distro
                list(
                    "Manager",
                    vec!["apt", "dpkg", "dnf", "pacman", "rpm", "xbps"],
                ),
                button("Launch"),
                label(""),
                // A button that allows the user to return to previous menu
                back_button("back"),
            ],
        ),
        submenu(
            "Calculator",
            vec![
                list("Method", vec!["+", "-", "*", "/"]),
                numeric("Num_1", 0.0, None, None, None),
                numeric("Num_1", 0.0, None, None, None),
                button("Calculate"),
                back_button("back"),
            ],
        ),
        // Creats a sub-menu containing information about the programe author
        submenu(
            "Author Details",
            vec![
                label("My name damo and im cool"),
                label("Github: https://github.com/dam-0"),
                back_button("back"),
            ],
        ),
        // Creats a sub-menu explining why the programe was made
        submenu(
            "Design Philosophy",
            vec![
                label("Programme was made"),
                label("to annoy Jake"),
                back_button("back"),
            ],
        ),
        label(""),
        button("Exit"),
    ]);

    // Creats loop to keep the menu up until the user decides to quit
    while mut_menu(&menu).selected_item_name() != "Exit" {
        run(&menu);
        if mut_menu(&menu).canceled() == true {
            exit(0)
        }
        {
            if mut_menu(&menu).selected_item_name() != "Exit" {
                // Launches damo_fetch
                if mut_menu(&menu)
                    .get_submenu("Damo Fetch")
                    .selected_item_name()
                    == "Launch"
                {
                    display_screen(
                        mut_menu(&menu)
                            .get_submenu("Damo Fetch")
                            .selection_value("Manager"),
                    );

                    println!("");
                    utils::pause();

                    // Clears the screen
                    print!("{}[2J", 27 as char)
                };

                    // Clears the screen
                    //print!("{}[2J", 27 as char)
                }
            }
        }
    }

fn main() {
    launch();
}

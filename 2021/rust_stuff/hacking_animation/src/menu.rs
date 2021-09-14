use crossterm::style::Color;
use std::process::exit;
use terminal_menu::{
    activate, back_button, button, label, list, menu, mut_menu, numeric, run, scroll, string,
    submenu, wait_for_exit,
};
mod utils;

// Creates function that holes the menus
pub fn launch() {
    // sets var that contains the menu
    let menu = menu(vec![
        // Creats the title menu
        label(""),
        label("Password Cracker").colorize(Color::Red),
        label("============="),
        label(""),

        // Creats a sub-menu containing information about the programe author
        submenu(
            "Details",
            vec![
                label("Programe made for cracking"),
                back_button("back"),
            ],
        ),
        label(""),
        button("Exit"),
    ]);

        run(&menu);
        if mut_menu(&menu).canceled() == true {
            exit(0);
        }
    }
    
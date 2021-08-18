use std::{fmt::Result, str};
use crossterm::{event::DisableMouseCapture, style::Print};
use terminal_menu::{menu, list, label, button, run, mut_menu, scroll, back_button, submenu, string, numeric};

#[path = "../../damo_fetch/src/"]
mod damo_fetch {
    mod damo_fetch;
}





fn launch() {
    let menu = menu(vec![

        // label:
        //  not selectable, usefule as a title, separator, etc...
        label("----------------------"),
        label("Damos GUI menu"),
        label("use wasd or arrow keys"),
        label("enter to select"),
        label("'q' or esc to exit"),
        label("-----------------------"),

        
        submenu("Damo Fetch", vec![
            label("Select the appropirate"),
            label("Package manager"),

            list("Manager:", vec!["apt", "dpkg", "dnf", "pacman", "rpm", "xbps"]),

            button("Launch"),
           // button(damo_fetch::display_screen()),
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

    if  mut_menu(&menu).selected_item_name() == "Damo Fetch" {
        damo_fetch::display_screen();
    }

}

fn main() {
    launch();
    
}
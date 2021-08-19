pub fn cpu_details() {
    println!("CPU: {}", nixinfo::cpu().unwrap());
   // println!("cpu temp: {}", nixinfo::temp().unwrap());

}

pub fn device_details() {
    println!("Machine: {}", nixinfo::device().unwrap())
}

pub fn distro_details() {
    println!("Distro: {}", nixinfo::distro().unwrap())
}

pub fn gpu_details() {
    println!("GPU: {}", nixinfo::gpu().unwrap())
}

pub fn host_details() {
    println!("Hostname: {}", nixinfo::hostname().unwrap())
}

pub fn memory_details() {
    println!("Mem: {}", nixinfo::memory().unwrap())
}

pub fn package_details(manager: &str) {
    let distro_man= vec!["apt", "dpkg", "dnf", "pacman", "rpm", "xbps"];

    if distro_man.contains(&manager) {
        println!("Packages No: {}", nixinfo::packages(manager).unwrap())
    } else {
        println!("Packages No: N/A");
    }
}

pub fn terminal_details() {
    println!("Terminal: {}", nixinfo::terminal().unwrap())
}

pub fn uptime_details() {
    println!("Uptime: {}", nixinfo::uptime().unwrap())
}

pub fn environment_details() {
    println!("DE: {}", nixinfo::environment().unwrap())
}

pub fn kernel_details() {
    println!("Kernal: {}", nixinfo::kernel().unwrap())
}


pub fn display_screen(choice: &str) {
    host_details();
    kernel_details();
    device_details();
    distro_details();
    cpu_details();
    gpu_details();
    memory_details();
    package_details(choice);
    terminal_details();
    environment_details();
    uptime_details();
}

/*TODO
|Auto select proper package manager|
|Skip any info that would fail|
|Fix any missing info|
|Pretty up output|
|SPEEED| */

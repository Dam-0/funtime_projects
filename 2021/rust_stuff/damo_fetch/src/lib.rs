use async_std::task;
extern crate async_std;


pub async fn cpu_details() {
    println!("CPU: {}", nixinfo::cpu().unwrap());
   // println!("cpu temp: {}", nixinfo::temp().unwrap());

}

pub async fn device_details() {
    println!("Machine: {}", nixinfo::device().unwrap())
}

pub async fn distro_details() {
    println!("Distro: {}", nixinfo::distro().unwrap())
}

pub async fn gpu_details() {
    println!("GPU: {}", nixinfo::gpu().unwrap())
}

pub async fn host_details() {
    println!("Hostname: {}", nixinfo::hostname().unwrap())
}

pub async fn memory_details() {
    println!("Mem: {}", nixinfo::memory().unwrap())
}

pub async fn package_details(manager: &str) {
    let distro_man= vec!["apt", "dpkg", "dnf", "pacman", "rpm", "xbps"];

    if distro_man.contains(&manager) {
        println!("Packages No: {}", nixinfo::packages(manager).unwrap_or(("N/A").to_string())
        )
    } else {
        println!("Packages No: N/A");
    }
}

pub async fn terminal_details() {
    println!("Terminal: {}", nixinfo::terminal().unwrap())
}

pub async fn uptime_details() {
    println!("Uptime: {}", nixinfo::uptime().unwrap())
}

pub async fn environment_details() {
    println!("DE: {}", nixinfo::environment().unwrap())
}

pub async fn kernel_details() {
    println!("Kernal: {}", nixinfo::kernel().unwrap())
}


pub fn display_screen(choice: &str) {
    task::block_on(host_details());
    task::block_on(kernel_details());
    task::block_on(device_details());
    task::block_on(distro_details());
    task::block_on(cpu_details());
    task::block_on(gpu_details());
    task::block_on(memory_details());
    task::block_on(package_details(choice));
    task::block_on(terminal_details());
    task::block_on(environment_details());
    task::block_on(uptime_details());
}

/*TODO
|Auto select proper package manager|
|Skip any info that would fail|
|Fix any missing info|
|Pretty up output|
|SPEEED| */

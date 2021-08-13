use nixinfo::{
    cpu, device, distro, environment, gpu, hostname, kernel, memory, packages,
    terminal, uptime};


fn cpu_details() {
    println!("cpu name: {}", nixinfo::cpu().unwrap())
    //println!("cpu temp: {}", nixinfo::temp().unwrap())

}

fn device_details() {
    println!("machine: {}", nixinfo::device().unwrap())
}

fn distro_details() {
    println!("distro: {}", nixinfo::distro().unwrap())
}

fn gpu_details() {
    println!("gpu: {}", nixinfo::gpu().unwrap())
}

fn host_details() {
    println!("hostname: {}", nixinfo::hostname().unwrap())
}

fn memory_details() {
    println!("mem: {}", nixinfo::memory().unwrap())
}

fn package_details() {
    println!("packages No: {}", nixinfo::packages("apt").unwrap())
}

fn terminal_details() {
    println!("terminal: {}", nixinfo::terminal().unwrap())
}

fn uptime_details() {
    println!("uptime: {}", nixinfo::uptime().unwrap())
}

fn environment_details() {
    println!("de: {}", nixinfo::environment().unwrap())
}

fn main() {

    cpu_details();
    device_details();
    distro_details();
    gpu_details();
    host_details();
    memory_details();
    package_details();
    terminal_details();
    uptime_details();
    environment_details();
    
}

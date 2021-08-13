use nixinfo::{cpu, device, distro, environment, gpu, hostname, kernel, memory, packages, terminal, uptime};
use std::thread;


fn cpu_details() {
    println!("cpu name: {}", cpu().unwrap())
    //println!("cpu temp: {}", nixinfo::temp().unwrap())

}

fn device_details() {
    println!("machine: {}", device().unwrap())
}

fn distro_details() {
    println!("distro: {}", distro().unwrap())
}

fn gpu_details() {
    println!("gpu: {}", gpu().unwrap())
}

fn host_details() {
    println!("hostname: {}", hostname().unwrap())
}

fn memory_details() {
    println!("mem: {}", memory().unwrap())
}

fn package_details() {
    println!("packages No: {}", packages("apt").unwrap())
}

fn terminal_details() {
    println!("terminal: {}", terminal().unwrap())
}

fn uptime_details() {
    println!("uptime: {}", uptime().unwrap())
}

fn environment_details() {
    println!("de: {}", environment().unwrap())
}

fn kernel_details() {
    println!("kernal: {}", kernel().unwrap())
}







fn main() {

    thread::spawn(|| {package_details()});
    cpu_details();
    device_details();
    distro_details();
    gpu_details();
    host_details();
    memory_details();
    terminal_details();
    uptime_details();
    environment_details();
    kernel_details();
    
}

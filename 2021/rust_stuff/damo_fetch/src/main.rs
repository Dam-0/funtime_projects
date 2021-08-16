fn cpu_details() {
    println!("CPU: {}", nixinfo::cpu().unwrap());
   // println!("cpu temp: {}", nixinfo::temp().unwrap());

}

fn device_details() {
    println!("Machine: {}", nixinfo::device().unwrap())
}

fn distro_details() {
    println!("Distro: {}", nixinfo::distro().unwrap())
}

fn gpu_details() {
    println!("GPU: {}", nixinfo::gpu().unwrap())
}

fn host_details() {
    println!("Hostname: {}", nixinfo::hostname().unwrap())
}

fn memory_details() {
    println!("Mem: {}", nixinfo::memory().unwrap())
}

fn package_details() {
    println!("Packages No: {}", nixinfo::packages("apt").unwrap())
}

fn terminal_details() {
    println!("Terminal: {}", nixinfo::terminal().unwrap())
}

fn uptime_details() {
    println!("Uptime: {}", nixinfo::uptime().unwrap())
}

fn environment_details() {
    println!("DE: {}", nixinfo::environment().unwrap())
}

fn kernel_details() {
    println!("Kernal: {}", nixinfo::kernel().unwrap())
}


fn main() {
    host_details();
    kernel_details();
    device_details();
    distro_details();
    cpu_details();
    gpu_details();
    memory_details();
    package_details();
    terminal_details();
    environment_details();
    uptime_details();
}



use std::fs;
use std::fs::File;
use regex::Regex;




use std::io::prelude::*;
use std::io::Error;

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


fn os_release() -> Result<String, Error> {
        let re = Regex::new(r#"^ID_LIKE=(.*)$"#).unwrap();
        let mut s = String::new();
        File::open("/etc/os-release")?.read_to_string(&mut s)?;
        s.pop(); // pop '\n'
        let caps = re.captures(&mut s).unwrap();

        //assert!(re.is_match("{}"));
        Ok(s)
}


fn read_file(filename: &str) -> Result<String, Error> {
    let mut file = File::open(filename)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    Ok(contents)
}


fn parse_os(){
    let mut file = File::open("/etc/os-release");
    let mut contents = String::new();
    let test = fs::read_to_string(&mut contents);

    let package_man_regex = Regex::new(r#"ID_LIKE="(\w+)"#).unwrap();

    let package_man = match package_man_regex.captures_iter(&test).next() {
            Some(package_man) => Some(package_man.as_str().to_owned()),
            None => None,
        },
        None => None,
    };
    println!("{:?}", package_man)

    
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
    //os_release();
    parse_os();
   // println!("{}", sys_info::LinuxOSReleaseInfo("id_like"))

}

/*TODO
|Auto select proper package manager|
|Skip any info that would fail|
|Fix any missing info|
|Pretty up output|
|SPEEED| */

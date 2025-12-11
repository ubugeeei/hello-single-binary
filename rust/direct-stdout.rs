use std::io::Write;

fn main() {
    std::io::stdout().write_all(b"Hello, World!\n").unwrap();
}

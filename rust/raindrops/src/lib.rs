pub fn raindrops(n: u32) -> String {
    let is_factor = |factor| n % factor == 0;
    let mut rez = String::new();

    if is_factor(3) { rez.push_str("Pling"); }
    if is_factor(5) { rez.push_str("Plang"); }
    if is_factor(7) { rez.push_str("Plong"); }

    if rez.is_empty() { rez = n.to_string(); }

    rez
}

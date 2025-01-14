use std::hash::poseidon2;

fn main(password: Field, hashed_password: pub Field) -> pub bool {
    let is_valid = poseidon2::Poseidon2::hash([password], 1) == hashed_password;
    assert(is_valid);
    is_valid
}

fn string_to_field<let N: u32>(pw: str<N>) -> Field {
    let pw_field = pw.as_bytes().map(|f| f as Field);
    let pw_to_field = std::hash::hash_to_field(pw_field);

    pw_to_field
}

#[test]
fn test_password_hash() {
    let pw = string_to_field("fancy password");
    let hashed_password = 0x2564595b7e48d859e8513434bc6a20cbe9dfc7280d6572ba059fbbcd299bae3d;

    let result = main(pw, hashed_password);
    assert(result);
}

#[test]
fn test_password_hash_fail() {
    let pw = string_to_field("fancy password");
    let hashed_password = 0x0fdc0ac2d63c043e624f96fa51270e4935c89de1e29814b5703c6b940eb64947;

    let result = main(pw, hashed_password);
    assert(!result);
}

#[test]
fn test_password_hash_fail_wrong_hash() {
    let pw = string_to_field("fancy password");
    let hashed_password = 0x0fdd0ac2d63c043e624f96fa51270e4935c89de1e29814b5703c6b940eb64947;

    let result = main(pw, hashed_password);
    assert(!result);
}

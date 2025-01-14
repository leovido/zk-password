use std::hash::poseidon2;

fn main(password: Field, hashed_password: pub Field) -> pub bool {
    poseidon2::Poseidon2::hash([password], 1) == hashed_password
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

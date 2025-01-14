use std::hash::poseidon2;

fn main(password: Field, stored_hash: pub Field) -> pub bool {
    poseidon2::Poseidon2::hash([password], 1) == stored_hash
}

fn string_to_field<let N: u32>(pw: str<N>) -> Field {
    let pw_field = pw.as_bytes().map(|f| f as Field);
    let pw_to_field = std::hash::hash_to_field(pw_field);

    pw_to_field
}

#[test]
fn test_password_hash() {
    let pw = string_to_field("fancy password");
    let stored_hash = poseidon2::Poseidon2::hash([pw], 1);

    let result = main(pw, stored_hash);
    assert(result);
}

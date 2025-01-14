use std::hash::poseidon2;

fn main(password: Field, stored_hash: pub Field) -> pub bool {
    poseidon2::Poseidon2::hash([password], 1) == stored_hash
}

#[test]
fn test_password_hash() {
    let password_input = 1;
    let stored_hash = poseidon2::Poseidon2::hash([password_input], 1);

    let result = main(password_input, stored_hash);
    assert(result);
}

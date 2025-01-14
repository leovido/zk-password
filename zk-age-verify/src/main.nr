use std::hash::poseidon2::Poseidon2;

fn main(age_commit: pub Field, age: u8, expected_age: pub u8, age_blinding: u32) -> pub bool {
    let age_field = [age as Field];
    let recomputed_age_commit = Poseidon2::hash(age_field, age_blinding);

    // Ensure the commitments are valid
    let commit_valid = (recomputed_age_commit == age_commit);

    // Perform the comparison on the actual age values
    let comparison = (age >= expected_age);

    // The final assertion combines the validity of commitments and the comparison result
    assert(commit_valid & comparison);
    commit_valid & comparison
}

#[test]
fn test_verify_age_this() {
    let age: u8 = 20;
    let expected_age: u8 = 18;

    let age_blinding = 1;

    let age_commit = 0x29a0e60256827455d5daf3bd6bae941ecc9d216992e04e044d01f0f00fbf9851;

    let result = main(age_commit, age, expected_age, age_blinding);

    assert(result); // Should be true since 20 >= 18
}

#[test]
fn test_verify_age() {
    let age: u8 = 20;
    let expected_age: u8 = 18;
    let age_field = [age as Field];

    let age_blinding = 1;

    let age_commit = Poseidon2::hash(age_field, age_blinding);

    let result = main(age_commit, age, expected_age, age_blinding);

    assert(result); // Should be true since 20 >= 18
}

#[test]
fn test_verify_age_fail() {
    let age: u8 = 17;
    let expected_age: u8 = 18;
    let age_field = [age as Field];

    let age_blinding = 1;

    let age_commit = Poseidon2::hash(age_field, age_blinding);

    let result = main(age_commit, age, expected_age, age_blinding);

    assert(!result); // Should be false since 17 < 18
}

#[test]
fn test_verify_age_fail_wrong_age_commit() {
    let age: u8 = 30;
    let expected_age: u8 = 18;
    let age_field = [age as Field];
    let age_blinding = 3;

    let age_commit = std::hash::pedersen_hash_with_separator(age_field, age_blinding);

    let result = main(age_commit, age, expected_age, age_blinding);

    assert(!result);
}

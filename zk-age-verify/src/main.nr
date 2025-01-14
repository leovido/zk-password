use std::embedded_curve_ops::EmbeddedCurvePoint;

fn main(
    age_commit: pub EmbeddedCurvePoint,
    age: u8,
    expected_age: pub u8,
    age_blinding: u32,
) -> pub bool {
    let recomputed_age_commit =
        std::hash::pedersen_commitment_with_separator([age as Field], age_blinding);

    // Ensure the commitments are valid
    let commit_valid = (recomputed_age_commit == age_commit);

    // Perform the comparison on the actual age values
    let comparison = (age >= expected_age);

    // The final assertion combines the validity of commitments and the comparison result
    commit_valid & comparison
}

#[test]
fn test_verify_age() {
    let age: u8 = 20;
    let expected_age: u8 = 18;

    let age_blinding = 1;

    let age_commit = std::hash::pedersen_commitment_with_separator([age as Field], age_blinding);

    let result = main(age_commit, age, expected_age, age_blinding);

    assert(result); // Should be true since 20 >= 18
}

#[test]
fn test_verify_age_fail() {
    let age: u8 = 17;
    let expected_age: u8 = 18;

    let age_blinding = 1;

    let age_commit = std::hash::pedersen_commitment_with_separator([age as Field], age_blinding);

    let result = main(age_commit, age, expected_age, age_blinding);

    assert(!result); // Should be false since 17 < 18
}

#[test]
fn test_verify_age_fail_wrong_age_commit() {
    let age: u8 = 30;
    let expected_age: u8 = 18;

    let age_blinding = 3;

    let age_commit = std::hash::pedersen_commitment([age as Field]);

    let result = main(age_commit, age, expected_age, age_blinding);

    assert(!result);
}

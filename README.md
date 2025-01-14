# zk-password

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Noir](https://img.shields.io/badge/Built%20with-Noir-black)](https://noir-lang.org/)
[![ZK](https://img.shields.io/badge/Zero-Knowledge-blue)](https://en.wikipedia.org/wiki/Zero-knowledge_proof)

Learning Zero Knowledge Proofs (ZK) with Noir - A simple password verification implementation using Zero Knowledge Proofs.

## Overview

This project demonstrates a basic implementation of password verification using Zero Knowledge Proofs with Noir. Instead of revealing the actual password, the system proves knowledge of the correct password without exposing it.

## What is Zero Knowledge?

Zero Knowledge Proofs allow one party (the prover) to prove to another party (the verifier) that a statement is true without revealing any information beyond the validity of the statement. In this project's context:

- The prover demonstrates they know the correct password
- The verifier can confirm this is true
- The actual password is never revealed in the process

## Why Noir?

[Noir](https://noir-lang.org/) is a Domain Specific Language for writing zero-knowledge proofs. It offers:

- Simple, Rust-like syntax
- Built-in cryptographic primitives
- Efficient proof generation
- Strong type system
- Growing ecosystem and tooling

## Getting Started

[Installation and setup instructions here]

## Usage

[Usage examples and code snippets here]

## Learning Resources

- [Noir Documentation](https://noir-lang.org/docs)
- [Zero Knowledge Proofs Introduction](https://z.cash/technology/zksnarks/)
- [Awesome Zero Knowledge](https://github.com/matter-labs/awesome-zero-knowledge-proofs)

## Author

Created by [@leovido.eth](https://warpcast.com/leovido.eth)

## License

This project is MIT licensed.

# zk-password

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Noir](https://img.shields.io/badge/Built%20with-Noir-black)](https://noir-lang.org/)
[![ZK](https://img.shields.io/badge/Zero-Knowledge-blue)](https://en.wikipedia.org/wiki/Zero-knowledge_proof)
[![Tests](https://github.com/leovido/zk-password/actions/workflows/test.yml/badge.svg)](https://github.com/leovido/zk-password/actions/workflows/test.yml)

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

### Prerequisites

1. Install Nargo (Noir's package manager):

```bash
curl -L https://github.com/noir-lang/noir/releases/download/v1.0.0-beta.1/nargo-x86_64-unknown-linux-gnu.tar.gz -o nargo.tar.gz
tar -xvf nargo.tar.gz
sudo mv nargo /usr/local/bin/
```

2. Install Barretenberg (the proving system backend):

```bash
curl -L https://raw.githubusercontent.com/AztecProtocol/aztec-packages/refs/heads/master/barretenberg/bbup/install | bash
```

### Basic Commands

1. Compile the circuit:

```bash
nargo compile
```

2. Create a witness:

```bash
nargo execute
```

3. Check the circuit:

```bash
nargo check
```

## Learning Resources

- [Noir Documentation](https://noir-lang.org/docs)
- [Zero Knowledge Proofs Introduction](https://z.cash/technology/zksnarks/)
- [Awesome Zero Knowledge](https://github.com/matter-labs/awesome-zero-knowledge-proofs)

## Author

Created by [@leovido.eth](https://warpcast.com/leovido.eth)

## License

This project is MIT licensed.

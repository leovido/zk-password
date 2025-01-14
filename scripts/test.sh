#!/bin/bash

# Create a script called 'run_bb.sh'

echo "0️⃣ - Clearing up target folder"

nargo test --show-output

rm -rf ../target

echo "1️⃣ - Starting BB operations..."

# Step 1: Generate proof
echo "2️⃣ - Generating proof... 💻"
bb prove -b ./target/project.json -w ./target/project.gz -o ./target/proof
if [ $? -ne 0 ]; then
    echo "Error: Proof generation failed 🔴"
    exit 1
fi

# Step 2: Write verification key
echo "3️⃣ - Writing verification key... 🔑"
bb write_vk -b ./target/project.json -o ./target/vk
if [ $? -ne 0 ]; then
    echo "Error: Writing verification key failed 🔴"
    exit 1
fi

# Step 3: Verify proof
echo "4️⃣ - Verifying proof... 🔍"
bb verify -k ./target/vk -p ./target/proof
if [ $? -ne 0 ]; then
    echo "Error: Verification failed 🔴"
    exit 1
fi

echo "All operations completed successfully! ✅"
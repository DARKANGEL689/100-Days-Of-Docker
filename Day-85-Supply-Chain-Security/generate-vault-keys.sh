#!/bin/bash
echo "Synthesizing Asymmetric Cryptographic Keypair..."
export COSIGN_PASSWORD=""
./cosign.exe generate-key-pair

echo "--------------------------------------------------------"
echo "Vault generated successfully."
echo "Keep 'cosign.key' (Private) completely secret."
echo "We will distribute 'cosign.pub' (Public) to the cluster."
echo "--------------------------------------------------------"
#!/bin/bash
echo "Installing Sigstore Cosign CLI..."
curl -O -L "https://github.com/sigstore/cosign/releases/latest/download/cosign-linux-amd64"
mv cosign-linux-amd64 cosign
chmod +x cosign

echo "Generating Enterprise Cryptographic Keypair..."

./cosign generate-key-pair

echo "Keys generated successfully. Do NOT commit the private key to version control."
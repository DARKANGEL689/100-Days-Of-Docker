#!/bin/bash
echo "Generating RSA-2048 Cryptographic Keypair..."

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout tls.key -out tls.crt \
  -subj "/CN=the300protocol.local"

echo "Injecting keys into Kubernetes Secret Vault..."
kubectl create secret tls gateway-tls-secret --key tls.key --cert tls.crt

echo "Cleaning up local keyfiles..."
rm tls.key tls.crt

echo "TLS Secret Provisioned Successfully."
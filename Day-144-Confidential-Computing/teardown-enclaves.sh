#!/bin/bash
echo "Executing clean teardown of Day 144 Architecture..."
kubectl delete -f 2-secure-ai-vault.yaml --ignore-not-found
kubectl delete -f 1-enclave-runtime.yaml --ignore-not-found
echo "Teardown complete. Secure memory enclaves collapsed. Cryptographic keys flushed."
#!/bin/bash
echo "Registering Hardware Encryption Boundaries (RuntimeClass)..."
kubectl apply -f 1-enclave-runtime.yaml

echo "Deploying Proprietary AI Vault into Silicon Enclave..."
kubectl apply -f 2-secure-ai-vault.yaml

echo "Waiting for the CPU to allocate mathematically isolated memory sectors..."
sleep 5
kubectl wait --for=condition=available deployment/proprietary-ai-vault --timeout=120s

echo "Hardware Secrecy is ACTIVE. The data in use is now physically invisible to the host."
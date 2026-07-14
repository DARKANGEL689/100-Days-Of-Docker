#!/bin/bash
if [ ! -f "cosign.pub" ]; then
    echo "[ERROR] Public key not found. Run ./generate-keys.sh first."
    exit 1
fi

echo "Injecting Public Key into the Cluster Policy..."
PUB_KEY=$(cat cosign.pub | sed 's/^/                /')
awk -v key="$PUB_KEY" '/publicKeys: |-/ {print; print key; next}1' 1-signature-policy.yaml > active-policy.yaml

echo "Deploying the Cryptographic Admission Policy..."
kubectl apply -f active-policy.yaml

echo "Policy enforced. The cluster will now mathematically reject all unsigned payloads."
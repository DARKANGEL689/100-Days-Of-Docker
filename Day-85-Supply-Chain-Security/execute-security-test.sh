#!/bin/bash
echo "[PHASE 1] Attempting to breach the cluster with an Unsigned Image..."
echo "--------------------------------------------------------"
kubectl apply -f 2-rogue-pod.yaml
echo "--------------------------------------------------------"
echo "If Kyverno threw a 'validation failure' error above, the perimeter held!"
echo ""

echo "[PHASE 2] Executing Cryptographic Signing of the Secure Artifact..."
export COSIGN_PASSWORD=""
./cosign.exe sign --key cosign.key darkangel689/alpha-node:signed --yes
echo "Image successfully signed and locked in the public registry."
echo ""

echo "[PHASE 3] Deploying the Signed Secure Workload..."
echo "--------------------------------------------------------"
kubectl apply -f 3-secure-pod.yaml
echo "--------------------------------------------------------"
echo "Deployment successful. Kyverno verified the signature!"
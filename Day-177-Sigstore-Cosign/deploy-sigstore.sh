#!/bin/bash
export COSIGN_PASSWORD=""

echo "[INIT] Installing CNCF Kyverno Policy Engine..."
helm repo add kyverno https://kyverno.github.io/kyverno/
helm upgrade --install kyverno kyverno/kyverno -n kyverno --create-namespace --wait

echo "[CRYPTOGRAPHY] Generating Cosign ECDSA Keypair..."
MSYS_NO_PATHCONV=1 docker run --rm -e COSIGN_PASSWORD=$COSIGN_PASSWORD -v "$(pwd):/workspace" -w /workspace gcr.io/projectsigstore/cosign:latest generate-key-pair

echo "[SECRETS] Injecting Public Key into Kubernetes API Server..."
kubectl create secret generic cosign-public-key --from-file=cosign.pub=cosign.pub -n default --dry-run=client -o yaml | kubectl apply -f -

echo "[REGISTRY] Uploading baseline payloads to ephemeral OCI registry (ttl.sh)..."
docker pull alpine:latest > /dev/null
docker tag alpine:latest ttl.sh/darkangel689-rogue:1h
docker tag alpine:latest ttl.sh/darkangel689-secure:1h
docker push ttl.sh/darkangel689-rogue:1h > /dev/null
docker push ttl.sh/darkangel689-secure:1h > /dev/null

echo "[SIGNING] Cryptographically signing the secure payload..."
MSYS_NO_PATHCONV=1 docker run --rm -e COSIGN_PASSWORD=$COSIGN_PASSWORD -v "$(pwd):/workspace" -w /workspace gcr.io/projectsigstore/cosign:latest sign --key cosign.key --tlog-upload=false --yes ttl.sh/darkangel689-secure:1h

echo "[POLICY] Enforcing Cryptographic Admission Controller..."
kubectl apply -f 1-kyverno-verify-policy.yaml
sleep 5

echo "Supply Chain Security Matrix is ARMED."
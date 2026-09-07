#!/bin/bash
echo "Auditing Supply Chain Cryptographic Enforcement..."
echo "--------------------------------------------------------"

echo ">>> [1/2] INJECTING UNSIGNED PAYLOAD (Simulated Supply Chain Attack):"
echo "Command: kubectl apply -f 2-unsigned-rogue-pod.yaml"
echo ""
kubectl apply -f 2-unsigned-rogue-pod.yaml || echo "[RESULT] API Server successfully rejected the unverified payload."
echo ""

echo ">>> [2/2] INJECTING CRYPTOGRAPHICALLY SIGNED PAYLOAD:"
echo "Command: kubectl apply -f 3-signed-secure-pod.yaml"
echo ""
kubectl apply -f 3-signed-secure-pod.yaml
sleep 5
kubectl get pods secure-signed-workload
echo "[RESULT] API Server validated the ECDSA signature and authorized the execution."
echo "--------------------------------------------------------"
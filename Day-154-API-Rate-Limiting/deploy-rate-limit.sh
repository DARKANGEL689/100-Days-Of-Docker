#!/bin/bash
echo "[DEPLOY] Provisioning Internal AI API Backend..."
kubectl apply -f 1-inference-backend.yaml

echo "[DEPLOY] Injecting Layer 7 Rate-Limiting Edge Gateway..."
kubectl apply -f 2-rate-limit-gateway.yaml

echo "[WAIT] Aligning network routing and waiting for ASGI servers to boot..."
sleep 15
kubectl wait --for=condition=available deployment/internal-ai-api --timeout=120s
kubectl wait --for=condition=available deployment/edge-firewall-gateway --timeout=120s

echo "Edge Shield is ARMED. Traffic shaping algorithms are active."
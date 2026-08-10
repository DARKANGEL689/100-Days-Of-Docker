#!/bin/bash
echo "[DEPLOY] Injecting Dual-Model Inference Matrix (V1 & V2)..."
kubectl apply -f 1-inference-models.yaml

echo "[DEPLOY] Provisioning Layer 7 API Gateway for Traffic Splitting..."
kubectl apply -f 2-api-gateway.yaml

echo "[WAIT] Aligning network routing and waiting for ASGI servers to boot..."
sleep 15
kubectl wait --for=condition=available deployment/transformer-v1 --timeout=120s
kubectl wait --for=condition=available deployment/transformer-v2 --timeout=120s
kubectl wait --for=condition=available deployment/ai-api-gateway --timeout=120s

echo "Canary Infrastructure is ARMED. 80/20 Traffic Split is active."
#!/bin/bash
echo "[DEPLOY] Provisioning Telemetry Cache..."
kubectl apply -f 1-telemetry-cache.yaml
sleep 5
kubectl wait --for=condition=available deployment/telemetry-cache --timeout=60s

echo "[DEPLOY] Provisioning Inference Logger API..."
kubectl apply -f 2-inference-logger.yaml
sleep 10
kubectl wait --for=condition=available deployment/inference-gateway --timeout=60s

echo "Drift Detection Matrix is ARMED."
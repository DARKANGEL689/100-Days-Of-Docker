#!/bin/bash
echo "[DEPLOY] Provisioning Redis In-Memory Cache..."
kubectl apply -f 1-redis-cache.yaml

echo "[WAIT] Aligning Database (10s)..."
sleep 10
kubectl wait --for=condition=available deployment/redis-llm-cache --timeout=60s

echo "[DEPLOY] Injecting Python FastAPI Gateway and Routing Logic..."
kubectl apply -f 2-llm-gateway.yaml
sleep 10
kubectl wait --for=condition=available deployment/llm-gateway --timeout=60s

echo "Semantic Cache Matrix is ARMED. Gateway is intercepting API payloads."
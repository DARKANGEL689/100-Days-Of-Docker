#!/bin/bash
echo "[DEPLOY] Provisioning Redis Online Feature Store..."
kubectl apply -f 1-redis-online-store.yaml

echo "[WAIT] Aligning in-memory data grids..."
sleep 5
kubectl wait --for=condition=available deployment/online-feature-store --timeout=60s

echo "[DEPLOY] Injecting ML Feature Serving API and executing Materialization..."
kubectl apply -f 2-feature-server.yaml
sleep 10
kubectl wait --for=condition=available deployment/feature-server --timeout=60s

echo "Feature Store Architecture is ARMED."
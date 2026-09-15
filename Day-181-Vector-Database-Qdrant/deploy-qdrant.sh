#!/bin/bash
echo "[DEPLOY] Provisioning Qdrant Vector Database StatefulSet..."
kubectl apply -f 1-qdrant-vector-db.yaml

echo "[WAIT] Aligning Persistent Volumes and Booting Vector Engine (30s)..."
sleep 5
kubectl wait --for=condition=ready pod/qdrant-memory-core-0 --timeout=120s

echo "Vector Database Matrix is ARMED. Awaiting embedding payloads."
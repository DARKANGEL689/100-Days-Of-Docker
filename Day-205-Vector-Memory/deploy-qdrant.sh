#!/bin/bash
echo "[DEPLOY] Provisioning Qdrant StatefulSet & gRPC Routing Mesh..."
kubectl apply -f 1-qdrant-statefulset.yaml

echo "[WAIT] Aligning High-Dimensional Database Core (15s)..."
sleep 5
kubectl wait --for=condition=ready pod -l app=qdrant --timeout=120s

echo "[DEPLOY] Injecting Agentic RAG Controller..."
kubectl apply -f 2-agent-memory-logic.yaml

echo "Vector Memory Matrix is ARMED. Agent is actively writing to the hippocampus."
#!/bin/bash
echo "[DEPLOY] Injecting Semantic Guardrail Logic (ConfigMap)..."
kubectl apply -f 1-guardrail-logic.yaml

echo "[DEPLOY] Provisioning AI Firewall Proxy & Routing Meshes..."
kubectl apply -f 2-semantic-proxy.yaml

echo "[WAIT] Aligning ASGI Server and Embedding Models (15s)..."
sleep 15
kubectl wait --for=condition=available deployment/semantic-firewall --timeout=60s

echo "Semantic Perimeter is ARMED. All agentic requests are now subject to intent validation."
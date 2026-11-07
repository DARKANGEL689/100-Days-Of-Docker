#!/bin/bash
echo "[INIT] Provisioning SRE Cryptographic Identities (RBAC)..."
kubectl apply -f 1-ai-sre-rbac.yaml

echo "[DEPLOY] Injecting Autonomous SRE Logic (ConfigMap)..."
kubectl apply -f 2-ai-sre-logic.yaml

echo "[DEPLOY] Launching AI SRE Bot and Vulnerable Target Matrix..."
kubectl apply -f 3-sre-deployment.yaml

echo "[WAIT] Aligning FastAPI Servers and Kubernetes Python SDKs (20s)..."
sleep 20
kubectl wait --for=condition=available deployment/autonomous-sre-bot --timeout=60s
kubectl wait --for=condition=available deployment/matrix-api-core --timeout=60s

echo "Autonomous Remediation Matrix is ARMED. SRE Bot is monitoring telemetry."
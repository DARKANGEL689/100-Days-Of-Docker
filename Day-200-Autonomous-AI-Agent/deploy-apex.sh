#!/bin/bash
echo "[INIT] Provisioning Cryptographic API Credentials (RBAC)..."
kubectl apply -f 1-agent-rbac.yaml

echo "[DEPLOY] Injecting Autonomous Python Brain (ConfigMap)..."
kubectl apply -f 2-agent-brain.yaml

echo "[DEPLOY] Launching AI Orchestrator Pod..."
kubectl apply -f 3-agent-deployment.yaml

echo "[WAIT] Aligning Agent memory and installing Kubernetes SDK (20s)..."
sleep 20
kubectl wait --for=condition=available deployment/autonomous-orchestrator --timeout=60s

echo "APEX Matrix is ARMED. The Agent is now analyzing the cluster."
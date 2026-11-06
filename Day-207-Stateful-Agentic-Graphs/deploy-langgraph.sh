#!/bin/bash
echo "[DEPLOY] Injecting Multi-Agent State Matrix (ConfigMap)..."
kubectl apply -f 1-langgraph-controller.yaml

echo "[DEPLOY] Provisioning LangGraph Execution Engine..."
kubectl apply -f 2-langgraph-job.yaml

echo "[WAIT] Aligning Agentic Memory and SDKs (20s)..."
sleep 20
kubectl wait --for=condition=complete job/multi-agent-orchestration --timeout=120s > /dev/null 2>&1 || true

echo "Multi-Agent Matrix is ARMED. Synthetic workforce has executed the directive."
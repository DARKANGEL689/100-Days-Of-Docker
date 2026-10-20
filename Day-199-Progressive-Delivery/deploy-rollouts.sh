#!/bin/bash
echo "[INIT] Provisioning Argo Rollouts Control Plane..."
kubectl create namespace argo-rollouts --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml

echo "[WAIT] Aligning Progressive Delivery Controllers (30s)..."
sleep 15
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=argo-rollouts -n argo-rollouts --timeout=120s

echo "[DEPLOY] Injecting V1 Baseline Canary Rollout..."
kubectl apply -f 1-canary-rollout.yaml
kubectl apply -f 2-canary-service.yaml

echo "[WAIT] Awaiting stable baseline initialization..."
sleep 10
kubectl wait --for=condition=available rollout/ai-inference-canary --timeout=120s

echo "Progressive Delivery Matrix is ARMED. Baseline V1 is routing 100% of traffic."
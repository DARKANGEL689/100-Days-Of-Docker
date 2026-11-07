#!/bin/bash
echo "[INIT] Adding Kubernetes Event-driven Autoscaling (KEDA) Helm Repository..."
helm repo add kedacore https://kedacore.github.io/charts
helm repo update

echo "[DEPLOY] Provisioning KEDA Operator & External Metrics Server..."
helm upgrade --install keda kedacore/keda \
  --namespace keda \
  --create-namespace \
  --wait

echo "[DEPLOY] Provisioning Redis Event Bus and Dormant AI Workers..."
kubectl apply -f 1-redis-queue.yaml
kubectl apply -f 2-ai-worker-node.yaml

echo "[WAIT] Aligning Database Topology (10s)..."
sleep 10
kubectl wait --for=condition=available deployment/telemetry-queue --timeout=60s

echo "[DEPLOY] Injecting Algorithmic ScaledObject CRD..."
kubectl apply -f 3-keda-scaler.yaml

echo "Predictive Scaling Matrix is ARMED. KEDA is actively polling the empty queue."
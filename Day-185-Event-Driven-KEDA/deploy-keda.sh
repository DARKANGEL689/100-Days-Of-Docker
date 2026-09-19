#!/bin/bash
echo "[INIT] Installing CNCF KEDA Core via Helm..."
helm repo add kedacore https://kedacore.github.io/charts
helm repo update
helm upgrade --install keda kedacore/keda \
  --namespace keda \
  --create-namespace \
  --wait

echo "[DEPLOY] Provisioning Redis Message Broker and Scale-to-Zero Workers..."
kubectl apply -f 1-broker-and-worker.yaml
sleep 5
kubectl wait --for=condition=available deployment/redis-broker --timeout=60s

echo "[DEPLOY] Injecting Event-Driven ScaledObject Algorithms..."
kubectl apply -f 2-keda-scaler.yaml
sleep 5

echo "KEDA Matrix is ARMED. Worker fleet is currently resting at 0 replicas."
#!/bin/bash
echo "[INIT] Installing CNCF Flagger Progressive Delivery Controller..."
helm repo add flagger https://flagger.app
helm repo update
helm upgrade --install flagger flagger/flagger \
  --namespace flagger-system \
  --create-namespace \
  --set prometheus.install=true \
  --wait

echo "[DEPLOY] Provisioning Baseline V1 Target API..."
kubectl apply -f 1-inference-api.yaml

echo "[DEPLOY] Injecting Canary Analysis CRD..."
kubectl apply -f 2-flagger-canary.yaml

echo "[WAIT] Allowing Flagger to initialize primary and canary routing geometries (15s)..."
sleep 15
kubectl wait --for=condition=Initialized canary/ml-inference-api --timeout=120s

echo "Progressive Delivery Matrix is ARMED."
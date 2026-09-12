#!/bin/bash
export KSERVE_VERSION="v0.11.2"

echo "[INIT] Provisioning Cert-Manager for Webhook Cryptography..."
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm upgrade --install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --set installCRDs=true \
  --wait

echo "[INIT] Deploying CNCF KServe Control Plane..."
kubectl apply -f https://github.com/kserve/kserve/releases/download/${KSERVE_VERSION}/kserve.yaml

echo "[WAIT] Aligning KServe Controllers (30s)..."
sleep 30
kubectl wait --for=condition=ready pod -l control-plane=kserve-controller-manager -n kserve --timeout=120s

echo "[DEPLOY] Provisioning Autonomous AI InferenceService..."
kubectl apply -f 1-inference-service.yaml

echo "[WAIT] Downloading model weights and booting MLServer engine..."
sleep 15
kubectl wait --for=condition=ready pod -l serving.kserve.io/inferenceservice=iris-classifier --timeout=120s

echo "KServe Matrix is ARMED. High-Performance inference endpoints are online."
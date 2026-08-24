#!/bin/bash
echo "[INIT] Installing CNCF External Secrets Operator via Helm..."
helm repo add external-secrets https://charts.external-secrets.io
helm repo update
helm upgrade --install external-secrets external-secrets/external-secrets \
  --namespace external-secrets \
  --create-namespace \
  --set installCRDs=true \
  --wait

echo "[DEPLOY] Provisioning Simulated External Vault Connection..."
kubectl apply -f 1-eso-secret-store.yaml

echo "[DEPLOY] Injecting ExternalSecret Sync Directive..."
kubectl apply -f 2-external-secret.yaml

echo "[WAIT] Allowing Operator to synchronize with external vault (5s)..."
sleep 5

echo "[DEPLOY] Provisioning Secure Consuming Workload..."
kubectl apply -f 3-consuming-pod.yaml
kubectl wait --for=condition=ready pod/secure-mlops-backend --timeout=60s

echo "GitOps Secrets Matrix is ARMED."
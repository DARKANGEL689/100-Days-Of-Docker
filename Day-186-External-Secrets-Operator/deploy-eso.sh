#!/bin/bash
echo "[INIT] Adding External Secrets Operator Helm Repository..."
helm repo add external-secrets https://charts.external-secrets.io
helm repo update

echo "[DEPLOY] Provisioning External Secrets Control Plane..."
helm upgrade --install external-secrets external-secrets/external-secrets \
  -n external-secrets \
  --create-namespace \
  --wait

echo "[DEPLOY] Establishing Connection to Simulated Enterprise Vault..."
kubectl apply -f 1-secret-store.yaml

echo "[DEPLOY] Injecting ExternalSecret CRD and Target Workload..."
kubectl apply -f 2-external-secret.yaml
kubectl apply -f 3-secure-workload.yaml

echo "[WAIT] Allowing ESO to poll the vault and materialize cryptographic assets (10s)..."
sleep 10
kubectl wait --for=condition=available deployment/secure-ai-worker --timeout=60s

echo "Enterprise Secret Matrix is ARMED. Passwords have been extracted and injected."
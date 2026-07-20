#!/bin/bash
echo "Adding External Secrets Operator Helm Repository..."
helm repo add external-secrets https://charts.external-secrets.io
helm repo update

echo "Deploying the GitOps Secrets Engine..."
helm install external-secrets external-secrets/external-secrets \
  --namespace external-secrets \
  --create-namespace \
  --set installCRDs=true

echo "Waiting for the Secrets Engine to initialize..."
kubectl wait --namespace external-secrets --for=condition=ready pod -l app.kubernetes.io/name=external-secrets --timeout=120s
kubectl wait --namespace external-secrets --for=condition=ready pod -l app.kubernetes.io/name=external-secrets-webhook --timeout=120s

echo "ESO is ONLINE. The cluster is ready to interface with physical cloud vaults."
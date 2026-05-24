#!/bin/bash
echo "Adding Jetstack Cert-Manager Helm Repository..."
helm repo add jetstack https://charts.jetstack.io
helm repo update

echo "Deploying Cert-Manager Cryptographic Automation Engine..."
helm install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.14.4 \
  --set installCRDs=true

echo "Waiting for Cryptographic Controllers to boot..."
kubectl wait --namespace cert-manager \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/instance=cert-manager \
  --timeout=120s

echo "Cert-Manager is ONLINE."
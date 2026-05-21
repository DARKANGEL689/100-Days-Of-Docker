#!/bin/bash
echo "Deploying Bitnami Sealed Secrets Cryptographic Controller..."
kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.27.1/controller.yaml

echo "Waiting for the Vault Controller to generate Master Keys..."
kubectl wait --namespace kube-system \
  --for=condition=ready pod \
  --selector=name=sealed-secrets-controller \
  --timeout=120s

echo "Vault Controller is ONLINE."
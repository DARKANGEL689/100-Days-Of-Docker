#!/bin/bash
echo "Adding HashiCorp Helm Repository..."
helm repo add hashicorp https://helm.releases.hashicorp.com
helm repo update

echo "Deploying HashiCorp Vault & Agent Injector..."
helm install vault hashicorp/vault \
  --set "server.dev.enabled=true" \
  --set "injector.enabled=true"

echo "Waiting for the Vault Engine to boot..."
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=vault --timeout=120s

echo "HashiCorp Vault is ONLINE."
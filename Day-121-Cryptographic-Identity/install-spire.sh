#!/bin/bash
echo "Adding SPIFFE/SPIRE Helm Repository..."
helm repo add spiffe https://spiffe.github.io/helm-charts/
helm repo update

echo "Deploying the Cryptographic Trust Authority (SPIRE)..."
helm install identity-plane spiffe/spire \
  --namespace spire-system \
  --create-namespace \
  --set global.spire.clusterName=enterprise-global-fleet \
  --set global.spire.trustDomain=enterprise.local

echo "Waiting for the Trust Authority to initialize..."
kubectl wait --namespace spire-system --for=condition=ready pod -l app.kubernetes.io/name=spire-server --timeout=120s
kubectl wait --namespace spire-system --for=condition=ready pod -l app.kubernetes.io/name=spire-agent --timeout=120s

echo "SPIRE is ONLINE. The cluster is ready to issue cryptographic passports."
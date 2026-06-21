#!/bin/bash
echo "Adding Bitnami Helm Repository for Backstage..."
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

echo "Deploying the Internal Developer Portal (Backstage)..."
helm install platform-portal bitnami/backstage \
  --namespace backstage-system \
  --create-namespace \
  --set backstage.command="node" \
  --set backstage.args={"packages/backend"}

echo "Waiting for the Backstage Database and Backend to initialize..."
kubectl wait --namespace backstage-system --for=condition=ready pod -l app.kubernetes.io/name=backstage --timeout=300s

echo "Platform Portal is ONLINE. The Golden Path is ready to be paved."
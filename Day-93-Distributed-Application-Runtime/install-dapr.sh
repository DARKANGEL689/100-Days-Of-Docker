#!/bin/bash
echo "Adding Dapr Helm Repository..."
helm repo add dapr https://dapr.github.io/helm-charts/
helm repo update

echo "Deploying Dapr Distributed Application Runtime..."
helm install dapr dapr/dapr \
  --namespace dapr-system \
  --create-namespace \
  --set global.logAsJson=true

echo "Waiting for Dapr Control Plane to initialize..."
kubectl wait --namespace dapr-system --for=condition=ready pod -l app.kubernetes.io/name=dapr --timeout=120s

echo "Dapr is ONLINE. The cluster is ready to abstract infrastructure."
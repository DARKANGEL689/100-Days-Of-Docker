#!/bin/bash
echo "Adding Qdrant Helm Repository..."
helm repo add qdrant https://qdrant.github.io/qdrant-helm
helm repo update

echo "Deploying Qdrant Vector Database..."
helm install enterprise-memory qdrant/qdrant \
  --namespace default \
  --set replicaCount=1

echo "Waiting for the Hippocampus to boot..."
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=qdrant --timeout=120s

echo "Qdrant is ONLINE. The cluster can now store mathematical memory."
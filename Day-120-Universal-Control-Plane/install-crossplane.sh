#!/bin/bash
echo "Adding Crossplane Helm Repository..."
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update

echo "Deploying the Universal Control Plane (Crossplane)..."
helm install crossplane crossplane-stable/crossplane \
  --namespace crossplane-system \
  --create-namespace

echo "Waiting for the Control Plane to initialize..."
kubectl wait --namespace crossplane-system --for=condition=ready pod -l app=crossplane --timeout=120s

echo "Crossplane is ONLINE. Kubernetes can now provision physical cloud infrastructure."
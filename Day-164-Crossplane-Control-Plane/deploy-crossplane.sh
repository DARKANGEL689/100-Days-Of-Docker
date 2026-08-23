#!/bin/bash
echo "[INIT] Installing Crossplane Universal Control Plane..."
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update
helm upgrade --install crossplane crossplane-stable/crossplane \
  --namespace crossplane-system \
  --create-namespace \
  --wait

echo "[DEPLOY] Injecting AWS S3 Provider Package..."
kubectl apply -f 1-aws-provider.yaml

echo "[WAIT] Allowing Crossplane to download and install AWS API schemas (can take 60s)..."
sleep 60

echo "[DEPLOY] Submitting physical AWS S3 Bucket request..."
kubectl apply -f 2-s3-bucket.yaml
echo "Crossplane matrix is ARMED."
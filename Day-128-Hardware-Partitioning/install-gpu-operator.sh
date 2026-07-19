#!/bin/bash
echo "Adding NVIDIA Helm Repository..."
helm repo add nvidia https://helm.ngc.nvidia.com/nvidia
helm repo update

echo "Deploying NVIDIA GPU Operator to the Control Plane..."
helm install gpu-operator nvidia/gpu-operator \
  --namespace gpu-operator \
  --create-namespace \
  --set migManager.enabled=true \
  --set mig.strategy=mixed

echo "Waiting for the GPU Operator to initialize node drivers..."
kubectl wait --namespace gpu-operator --for=condition=ready pod -l app=gpu-operator --timeout=300s

echo "NVIDIA Hardware Layer is ONLINE. The cluster can now interface with physical GPUs."
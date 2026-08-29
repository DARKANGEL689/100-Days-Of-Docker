#!/bin/bash
echo "[DEPLOY] Injecting GPU Time-Slicing ConfigMap & Device Plugin..."
kubectl apply -f 1-gpu-slicing-config.yaml
sleep 5
kubectl wait --for=condition=ready pod -l name=gpu-device-plugin -n kube-system --timeout=60s

echo "[DEPLOY] Provisioning Fractional AI Workloads across Sliced Compute..."
kubectl apply -f 2-fractional-ai-workloads.yaml
sleep 5
kubectl wait --for=condition=available deployment/vision-embedding-service --timeout=60s
kubectl wait --for=condition=available deployment/text-generation-service --timeout=60s

echo "Fractional GPU Virtualization Matrix is ARMED."
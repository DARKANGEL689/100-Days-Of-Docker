#!/bin/bash
echo "[INIT] Adding NVIDIA Device Plugin Helm Repository..."
helm repo add nvdp https://nvidia.github.io/k8s-device-plugin
helm repo update

echo "[DEPLOY] Injecting GPU Time-Slicing Configuration to Kernel Layer..."
kubectl apply -f 1-gpu-virtualization-config.yaml

echo "[DEPLOY] Provisioning NVIDIA Device Plugin with Virtualization Overrides..."
helm upgrade -i nvdp nvdp/nvidia-device-plugin \
  --namespace kube-system \
  --create-namespace \
  --set config.name=nvidia-time-slicing-config \
  --wait

echo "[WAIT] Aligning CUDA Context Switching Drivers (15s)..."
sleep 15
kubectl wait --for=condition=ready pod -l app.kubernetes.io/instance=nvdp -n kube-system --timeout=120s

echo "[DEPLOY] Initiating 5 Concurrent GPU Workloads..."
kubectl apply -f 2-parallel-ai-agents.yaml

echo "Hardware Virtualization Matrix is ARMED. The physical silicon has been fractured."
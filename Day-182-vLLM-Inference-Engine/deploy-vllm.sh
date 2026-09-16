#!/bin/bash
echo "[DEPLOY] Provisioning vLLM Inference Engine..."
kubectl apply -f 1-vllm-deployment.yaml

echo "[WAIT] Downloading model weights and establishing PagedAttention memory maps..."
echo "[SYSTEM] This may take up to 2 minutes depending on network bandwidth."

sleep 10
kubectl wait --for=condition=available deployment/vllm-engine --timeout=300s

echo "vLLM Matrix is ARMED. High-throughput text generation endpoints are online."
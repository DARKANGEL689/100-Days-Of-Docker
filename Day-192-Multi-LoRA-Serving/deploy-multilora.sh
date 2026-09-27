#!/bin/bash
echo "[DEPLOY] Provisioning vLLM Engine with LoRA Multiplexing..."
kubectl apply -f 1-vllm-multilora.yaml

echo "[WAIT] Establishing PagedAttention VRAM allocations and LoRA registry (45s)..."
sleep 15
kubectl wait --for=condition=available deployment/vllm-multilora-engine --timeout=300s

echo "Multi-LoRA Matrix is ARMED. Engine is ready for dynamic adapter hot-swapping."
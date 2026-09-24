#!/bin/bash
echo "[DEPLOY] Injecting PEFT Python Logic (ConfigMap)..."
kubectl apply -f 1-lora-training-script.yaml

echo "[DEPLOY] Provisioning Kubernetes Batch Job for LoRA Execution..."
kubectl apply -f 2-lora-training-job.yaml

echo "[WAIT] Aligning compute resources and pulling container images (30s)..."
sleep 5
kubectl wait --for=condition=ready pod -l job-name=lora-finetuning-matrix --timeout=120s

echo "LoRA Matrix is ARMED. Fine-tuning execution is active in the background."
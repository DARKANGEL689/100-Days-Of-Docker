#!/bin/bash
echo "[INIT] Provisioning Kubeflow Training Operator..."
kubectl apply -k "github.com/kubeflow/training-operator/manifests/overlays/standalone?ref=v1.7.0"

echo "[WAIT] Aligning Distributed Controllers (30s)..."
sleep 30
kubectl wait --for=condition=ready pod -l control-plane=kubeflow-training-operator -n kubeflow --timeout=120s

echo "[DEPLOY] Injecting FSDP Python Logic (ConfigMap)..."
kubectl apply -f 1-fsdp-training-script.yaml

echo "[DEPLOY] Initializing PyTorchJob Matrix (1 Master, 2 Workers)..."
kubectl apply -f 2-pytorch-distributed-job.yaml

echo "FSDP Matrix is ARMED. Kubeflow is establishing the distributed communication ring."
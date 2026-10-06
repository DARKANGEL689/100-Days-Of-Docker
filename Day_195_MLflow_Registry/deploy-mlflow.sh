#!/bin/bash
echo "[DEPLOY] Provisioning MLflow Tracking Server & SQLite Backend..."
kubectl apply -f 1-mlflow-server.yaml

echo "[WAIT] Aligning Relational Database (10s)..."
sleep 10
kubectl wait --for=condition=available deployment/mlflow-tracking-server --timeout=60s

echo "[DEPLOY] Injecting Instrumented PyTorch Training Job..."
kubectl apply -f 2-mlflow-training-job.yaml

echo "[WAIT] Awaiting Training Convergence and Metric Streaming..."
sleep 5
kubectl wait --for=condition=complete job/mlflow-experiment-job --timeout=120s

echo "MLflow Matrix is ARMED. Model parameters have been immortalized."
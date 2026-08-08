#!/bin/bash
echo "Provisioning PostgreSQL Metadata Backend..."
kubectl apply -f 1-postgres-backend.yaml

echo "Waiting for DB availability..."
sleep 5
kubectl wait --for=condition=available deployment/mlflow-db --timeout=120s

echo "Booting MLflow Tracking & Artifact Server..."
kubectl apply -f 2-mlflow-server.yaml
sleep 15
kubectl wait --for=condition=available deployment/mlflow-tracking-server --timeout=120s

echo "Executing AI Training Workload with Lineage Telemetry..."
kubectl apply -f 3-mlflow-training-job.yaml

echo "Governance Infrastructure is ARMED. Models are under tracking protocol."
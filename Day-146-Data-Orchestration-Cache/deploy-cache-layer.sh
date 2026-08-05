#!/bin/bash
echo "Registering Virtualized Cache Primitives (StorageClass & PVC)..."
kubectl apply -f 1-alluxio-storage.yaml

echo "Deploying High-Throughput AI Training Payload..."
kubectl apply -f 2-cached-training-loop.yaml

echo "Waiting for CSI controllers to map local NVMe paths into target containers..."
sleep 10
kubectl wait --for=condition=available deployment/high-throughput-trainer --timeout=120s

echo "Data Orchestration Matrix is ARMED. Checkpoint operations are running unthrottled."
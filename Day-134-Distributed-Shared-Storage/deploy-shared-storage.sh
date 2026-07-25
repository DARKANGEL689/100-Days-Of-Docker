#!/bin/bash
echo "Deploying Storage Backends (Redis Metadata & MinIO S3 Chunks)..."
kubectl apply -f 1-storage-backends.yaml

echo "Waiting for storage engines to initialize..."
sleep 5
kubectl wait --for=condition=available deployment/juicefs-metadata-engine --timeout=60s
kubectl wait --for=condition=available deployment/juicefs-data-engine --timeout=60s

MINIO_POD=$(kubectl get pods -l app=juicefs-minio -o jsonpath='{.items[0].metadata.name}')
kubectl exec $MINIO_POD -- mkdir -p /data/juicefs-data

echo "Deploying JuiceFS StorageClass and Formatting Volume..."
kubectl apply -f 2-juicefs-system.yaml

echo "Deploying Distributed Writer Pods (Alpha & Beta)..."
kubectl apply -f 3-distributed-workload.yaml

echo "Waiting for JuiceFS CSI to mount the ReadWriteMany volumes..."
sleep 10
kubectl wait --for=condition=available deployment/data-ingester-alpha --timeout=120s
kubectl wait --for=condition=available deployment/data-ingester-beta --timeout=120s

echo "Shared Filesystem is ACTIVE. Pods are writing concurrently."
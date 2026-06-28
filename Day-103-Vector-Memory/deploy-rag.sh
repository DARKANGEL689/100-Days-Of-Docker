#!/bin/bash
echo "Uploading Neural Scripts to ConfigMap..."
kubectl apply -f 1-memory-scripts.yaml

echo "Executing Data Ingestion Sequence..."
kubectl delete job memory-ingestion-run --ignore-not-found
kubectl apply -f 2-rag-jobs.yaml

echo "Waiting for Ingestion to complete (The pod is downloading the embedding model)..."
kubectl wait --for=condition=complete job/memory-ingestion-run --timeout=300s || true

echo "Data embedded. The Agent is now querying the memory..."
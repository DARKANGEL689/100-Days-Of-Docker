#!/bin/bash
echo "Executing clean teardown of Day 181 Architecture..."
kubectl delete -f 1-qdrant-vector-db.yaml --ignore-not-found

kubectl delete pvc qdrant-storage-qdrant-memory-core-0 --ignore-not-found

echo "Teardown complete. Vector embeddings wiped from memory."
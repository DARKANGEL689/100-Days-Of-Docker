#!/bin/bash
echo "Executing clean teardown of Day 205 Architecture..."
kubectl delete -f 2-agent-memory-logic.yaml --ignore-not-found
kubectl delete -f 1-qdrant-statefulset.yaml --ignore-not-found
echo "Teardown complete. Vector embeddings and collections flushed."
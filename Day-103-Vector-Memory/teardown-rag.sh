#!/bin/bash
echo "Executing clean teardown of Day 103 Architecture..."
kubectl delete -f 2-rag-jobs.yaml --ignore-not-found
kubectl delete -f 1-memory-scripts.yaml --ignore-not-found
echo "Teardown complete. Jobs cleared."
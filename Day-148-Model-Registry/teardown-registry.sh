#!/bin/bash
echo "Executing clean teardown of Day 148 Architecture..."
kubectl delete -f 3-mlflow-training-job.yaml --ignore-not-found
kubectl delete -f 2-mlflow-server.yaml --ignore-not-found
kubectl delete -f 1-postgres-backend.yaml --ignore-not-found
echo "Teardown complete. Registry allocations released."
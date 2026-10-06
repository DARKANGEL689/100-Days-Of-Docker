#!/bin/bash
echo "Executing clean teardown of Day 195 Architecture..."
kubectl delete -f 2-mlflow-training-job.yaml --ignore-not-found
kubectl delete -f 1-mlflow-server.yaml --ignore-not-found
echo "Teardown complete. Tracking servers and relational metric databases collapsed."
#!/bin/bash
echo "Executing clean teardown of Day 149 Architecture..."
kubectl delete -f 3-inference-hpa.yaml --ignore-not-found
kubectl delete -f 2-inference-deployment.yaml --ignore-not-found
kubectl delete -f 1-inference-logic.yaml --ignore-not-found
echo "Teardown complete. API endpoints closed."
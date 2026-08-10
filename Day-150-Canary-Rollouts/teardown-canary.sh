#!/bin/bash
echo "Executing clean teardown of Day 150 Architecture..."
kubectl delete -f 2-api-gateway.yaml --ignore-not-found
kubectl delete -f 1-inference-models.yaml --ignore-not-found
echo "Teardown complete. API Gateways flushed."
#!/bin/bash
echo "Executing clean teardown of Day 154 Architecture..."
kubectl delete -f 2-rate-limit-gateway.yaml --ignore-not-found
kubectl delete -f 1-inference-backend.yaml --ignore-not-found
echo "Teardown complete. Traffic shaping gateways flushed."
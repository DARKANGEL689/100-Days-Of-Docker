#!/bin/bash
echo "Injecting Global Service Annotations into both clusters..."
kubectl apply --context context-aws -f 1-global-service.yaml
kubectl apply --context context-gcp -f 1-global-service.yaml

echo "Deploying Regional Backends to physical architectures..."
kubectl apply --context context-aws -f 2-regional-backends.yaml
kubectl apply --context context-gcp -f 2-regional-backends.yaml
awk '/auth-api-gcp/{flag=1} flag' 2-regional-backends.yaml | kubectl apply --context context-gcp -f -

echo "Waiting for BPF map synchronization across the trans-atlantic tunnel..."
sleep 10

echo "Global Flat Network is ARMED."
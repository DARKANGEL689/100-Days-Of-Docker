#!/bin/bash
echo "Executing clean teardown of Day 142 Architecture..."
kubectl delete --context context-aws -f 1-global-service.yaml --ignore-not-found
kubectl delete --context context-aws deployment/auth-api-aws --ignore-not-found
kubectl delete --context context-gcp -f 1-global-service.yaml --ignore-not-found
kubectl delete --context context-gcp deployment/auth-api-gcp --ignore-not-found
echo "Teardown complete. Trans-atlantic BPF maps flushed."
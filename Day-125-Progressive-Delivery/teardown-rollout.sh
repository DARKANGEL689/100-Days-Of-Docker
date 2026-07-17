#!/bin/bash
echo "Executing clean teardown of Day 125 Architecture..."
kubectl delete -f 1-canary-rollout.yaml --ignore-not-found
kubectl delete -f 3-services.yaml --ignore-not-found
kubectl delete -f 2-analysis-template.yaml --ignore-not-found
echo "Teardown complete. Progressive delivery pipeline flushed."
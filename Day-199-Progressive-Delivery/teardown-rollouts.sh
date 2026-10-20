#!/bin/bash
echo "Executing clean teardown of Day 199 Architecture..."
kubectl delete -f 2-canary-service.yaml --ignore-not-found
kubectl delete -f 1-canary-rollout.yaml --ignore-not-found
kubectl delete namespace argo-rollouts --ignore-not-found
echo "Teardown complete. Progressive delivery controllers detached."
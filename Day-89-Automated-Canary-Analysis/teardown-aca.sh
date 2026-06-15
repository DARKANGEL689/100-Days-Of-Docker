#!/bin/bash
echo "Executing clean teardown of Day 89 Architecture..."
kubectl delete -f 3-routing-service.yaml --ignore-not-found
kubectl delete rollout enterprise-api --ignore-not-found
kubectl delete -f 1-qa-analysis-template.yaml --ignore-not-found
echo "Teardown complete. Engine remains active."
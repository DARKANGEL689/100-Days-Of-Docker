#!/bin/bash
echo "Deploying Baseline V1 (Blue) Architecture..."
kubectl apply -f 1-canary-rollout.yaml
kubectl apply -f 2-rollout-service.yaml

echo "Waiting for all 5 replicas to stabilize..."
kubectl wait --for=condition=available rollout/enterprise-api --timeout=60s
echo "V1 is fully operational."
#!/bin/bash
echo "Deploying V1 (Blue) Baseline Architecture..."
kubectl apply -f 1-qa-analysis-template.yaml
kubectl apply -f 2-rollout-architecture.yaml
kubectl apply -f 3-routing-service.yaml

echo "Waiting for stable architecture to initialize..."
sleep 5
kubectl wait --for=condition=available rollout/enterprise-api --timeout=60s
echo "V1 is fully operational."
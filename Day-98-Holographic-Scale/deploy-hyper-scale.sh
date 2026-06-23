#!/bin/bash
echo "Initiating Hyper-Scale Deployment Sequence..."
kubectl apply -f 2-hyper-scale-deployment.yaml

echo "Tracking deployment rollout (This will happen unnaturally fast)..."
kubectl rollout status deployment/hyper-scale-api --timeout=120s

echo "Hyper-Scale workload is fully provisioned in the simulation."
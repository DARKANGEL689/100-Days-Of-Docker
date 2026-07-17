#!/bin/bash
echo "Injecting Algorithmic Auditor (AnalysisTemplate)..."
kubectl apply -f 2-analysis-template.yaml

echo "Deploying Split-Network Service Routing..."
kubectl apply -f 3-services.yaml

echo "Deploying Baseline Rollout (Stable Version)..."
kubectl apply -f 1-canary-rollout.yaml

echo "Waiting for the stable baseline to initialize..."
sleep 5
kubectl argo rollouts status enterprise-payment-api --watch=false

echo "Baseline secured. The Progressive Delivery pipeline is ready for updates."
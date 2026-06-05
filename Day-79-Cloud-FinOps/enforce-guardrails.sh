#!/bin/bash
echo "Executing FinOps Enforcement Protocol..."
kubectl apply -f 3-financial-guardrail.yaml

echo "Purging active workloads to force a budget re-evaluation..."
kubectl delete pods --all -n default

echo "Watching the cluster scheduler enforce the financial law:"
kubectl get pods -w
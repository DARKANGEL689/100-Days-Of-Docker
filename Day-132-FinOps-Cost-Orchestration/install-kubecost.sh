#!/bin/bash
echo "Adding Kubecost Helm Repository..."
helm repo add kubecost https://kubecost.github.io/cost-analyzer/
helm repo update

echo "Deploying the FinOps Cost Orchestration Engine..."
helm install enterprise-finops kubecost/cost-analyzer \
  --namespace kubecost \
  --create-namespace \
  --set kubecostToken="YmFzZTY0LWVuY29kZWQtZW1haWw="

echo "Waiting for Financial Telemetry databases to initialize..."
kubectl wait --namespace kubecost --for=condition=ready pod -l app=cost-analyzer --timeout=300s

echo "Kubecost is ONLINE. The cluster is now tracking physical dollar-burn rates."
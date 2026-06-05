#!/bin/bash
echo "Adding Kubecost Helm Repository..."
helm repo add kubecost https://kubecost.github.io/cost-analyzer/
helm repo update

echo "Deploying Enterprise Cost Analyzer (Kubecost)..."
helm install enterprise-finops kubecost/cost-analyzer \
  --namespace kubecost \
  --create-namespace \
  --set kubecostProductConfigs.clusterName="The-300-Protocol-Cluster"

echo "Waiting for FinOps Engine to boot..."
kubectl wait --namespace kubecost \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/instance=enterprise-finops \
  --timeout=300s

echo "Kubecost is ONLINE. Financial telemetry is actively scraping."
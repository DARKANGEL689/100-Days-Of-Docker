#!/bin/bash
echo "[INIT] Adding Kubecost CNCF Helm Repository..."
helm repo add kubecost https://kubecost.github.io/cost-analyzer/
helm repo update

echo "[DEPLOY] Provisioning Kubecost FinOps Control Plane..."
helm upgrade --install kubecost kubecost/cost-analyzer \
  --namespace kubecost \
  --create-namespace \
  --wait

echo "[DEPLOY] Provisioning High-Cost Target Workload..."
kubectl apply -f 1-expensive-ml-workload.yaml
sleep 5
kubectl wait --for=condition=available deployment/tensor-processing-unit -n heavy-ml-pipeline --timeout=60s

echo "FinOps Matrix is ARMED. Kubecost is currently calculating the dollar value of the cluster."
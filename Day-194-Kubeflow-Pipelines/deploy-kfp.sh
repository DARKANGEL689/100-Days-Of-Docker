#!/bin/bash
echo "[INIT] Adding Argo Workflows Helm Repository (KFP Execution Engine)..."
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

echo "[DEPLOY] Provisioning DAG Workflow Controllers..."
helm upgrade --install argo-workflows argo/argo-workflows \
  --namespace argo \
  --create-namespace \
  --set server.extraArgs={--auth-mode=server} \
  --wait

echo "[DEPLOY] Submitting Machine Learning DAG to the Execution Queue..."
kubectl create -f 1-ml-pipeline-dag.yaml

echo "Pipeline Matrix is ARMED. The Directed Acyclic Graph is currently executing."
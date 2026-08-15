#!/bin/bash
echo "[INIT] Installing Argo Workflows Controller via Helm..."
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm upgrade --install argo-workflows argo/argo-workflows \
  --namespace argo \
  --create-namespace \
  --set server.secure=false \
  --wait

echo "[DEPLOY] Provisioning Workflow Service Accounts and RBAC..."
kubectl apply -f 1-argo-rbac.yaml

echo "[EXECUTE] Submitting ML Training DAG to the Control Plane..."
WORKFLOW_NAME=$(kubectl create -f 2-ml-training-dag.yaml -o jsonpath='{.metadata.name}')

echo "Pipeline [$WORKFLOW_NAME] has been ARMED and is currently executing."
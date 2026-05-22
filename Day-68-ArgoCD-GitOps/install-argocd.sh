#!/bin/bash
echo "Initializing True GitOps Pipeline..."
echo "Creating ArgoCD Namespace..."
kubectl create namespace argocd

echo "Deploying ArgoCD Autonomous Agent..."
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "Waiting for the Agent to boot (this takes ~60 seconds)..."
kubectl wait --namespace argocd \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/name=argocd-server \
  --timeout=120s

echo "ArgoCD is ONLINE."
#!/bin/bash
echo "Creating Argo Rollouts Namespace..."
kubectl create namespace argo-rollouts --dry-run=client -o yaml | kubectl apply -f -

echo "Deploying Autonomous Rollout Controller..."
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml

echo "Downloading the Argo Rollouts CLI plugin for Windows..."
curl -sLO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-windows-amd64.exe
mv kubectl-argo-rollouts-windows-amd64.exe kubectl-argo-rollouts.exe
chmod +x kubectl-argo-rollouts.exe

echo "Waiting for the Controller to boot..."
kubectl wait --namespace argo-rollouts --for=condition=ready pod -l app.kubernetes.io/name=argo-rollouts --timeout=120s
echo "Argo Rollouts is ONLINE."
#!/bin/bash
echo "Deploying Argo Rollouts Controller to the Control Plane..."
kubectl create namespace argo-rollouts
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml

echo "Installing Argo Rollouts CLI Plugin..."
curl -LO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-windows-amd64.exe
mv kubectl-argo-rollouts-windows-amd64.exe /mingw64/bin/kubectl-argo-rollouts.exe

echo "Waiting for the Progressive Delivery Engine to initialize..."
kubectl wait --namespace argo-rollouts --for=condition=ready pod -l app.kubernetes.io/name=argo-rollouts --timeout=120s

echo "Argo Rollouts is ONLINE. Automated Canary Analysis is active."
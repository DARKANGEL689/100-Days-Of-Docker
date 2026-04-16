#!/bin/bash
echo "🔥 INITIATING CLUSTER RESURRECTION PROTOCOL 🔥"

echo "1. Installing Continuous Delivery Engine (ArgoCD)..."
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "2. Installing Progressive Delivery Brain (Argo Rollouts)..."
kubectl create namespace argo-rollouts
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml

echo "3. Waiting for API servers to boot (30s)..."
sleep 30

echo "4. Bridging Cluster to GitHub Source of Truth..."
kubectl apply -f Day-27-GitOps/3-argo-application.yaml

echo "✅ RESURRECTION COMPLETE. ArgoCD is now rebuilding Days 1 through 30."
#!/bin/bash
echo "Establishing Multi-Tenant Logical Boundaries (AppProject)..."
kubectl apply -f 1-gitops-project.yaml

echo "Deploying Sovereign Application Sync Matrix..."
kubectl apply -f 2-enterprise-application.yaml

echo "Waiting for ArgoCD to pull state from GitHub and synthesize the architecture..."
sleep 10
kubectl wait --for=condition=available deployment/guestbook-ui --timeout=120s

echo "GitOps synchronization complete. The cluster is locked to the remote repository."
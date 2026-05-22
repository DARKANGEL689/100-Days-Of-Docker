#!/bin/bash
echo "Auditing Autonomous GitOps Synchronization..."
echo "-------------------------------------------"
echo "Checking for GitOps API pods provisioned by ArgoCD:"
kubectl get pods -l app=gitops-api
echo "-------------------------------------------"
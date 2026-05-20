#!/bin/bash
echo "Deploying Development Architecture..."
kubectl apply -k overlays/dev

echo "Deploying Production Architecture..."
kubectl apply -k overlays/prod

echo "------------------------------------------------"
echo "Validating Multi-Environment Separation:"
kubectl get pods,svc -l managed-by=kustomize
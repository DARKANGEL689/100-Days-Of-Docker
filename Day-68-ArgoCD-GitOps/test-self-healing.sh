#!/bin/bash
echo "Executing Rogue Employee Simulation..."
echo "Manually deleting the gitops-api deployment..."
kubectl delete deployment gitops-api

echo "Watching ArgoCD autonomous self-healing response (Wait 10 seconds)..."
sleep 10
kubectl get pods -l app=gitops-api
echo "If pods are running, ArgoCD successfully overwrote the manual deletion!"
#!/bin/bash
echo "Initiating Chaos Engineering..."
POD_NAME=$(kubectl get pods -l app=database -o jsonpath="{.items[0].metadata.name}")

echo "Terminating Pod: $POD_NAME"
kubectl delete pod $POD_NAME

echo "Waiting for Kubernetes to provision a replacement pod..."
kubectl wait --for=condition=ready pod -l app=database --timeout=60s

NEW_POD=$(kubectl get pods -l app=database -o jsonpath="{.items[0].metadata.name}")
echo "New Pod ONLINE: $NEW_POD"
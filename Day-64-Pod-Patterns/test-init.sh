#!/bin/bash
echo "Deploying App with Init Container Dependency..."
kubectl apply -f init-dependency.yaml

echo "--------------------------------------------------------"
echo "Watch the Pod status. It will be stuck in 'Init:0/1'."
echo "Waiting 10 seconds to prove it is blocked..."
sleep 10
kubectl get pod strict-boot-app

echo "--------------------------------------------------------"
echo "Injecting missing Database Service..."
kubectl apply -f dummy-db.yaml

echo "Database online. Waiting for Init Container to unblock..."
kubectl wait --for=condition=ready pod strict-boot-app --timeout=30s
echo "SUCCESS: Main application has been authorized to boot."
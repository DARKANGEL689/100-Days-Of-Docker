#!/bin/bash
echo "Establishing AWS Vault Bridging (ClusterSecretStore)..."
kubectl apply -f 1-aws-secret-store.yaml

echo "Submitting Declarative Secret Request to ESO..."
kubectl apply -f 2-external-secret-request.yaml

echo "Waiting for ESO to fetch, decrypt, and synthesize native Kubernetes secrets..."
sleep 5

echo "Deploying Secure Database API..."
kubectl apply -f 3-secure-database-api.yaml

echo "Waiting for API pods to mount the synchronized credentials..."
sleep 5
kubectl wait --for=condition=available deployment/secure-database-api --timeout=60s

echo "GitOps Secrets Engine is ACTIVE. Passwords are decentralized."
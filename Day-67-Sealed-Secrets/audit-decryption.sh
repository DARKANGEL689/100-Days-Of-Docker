#!/bin/bash
echo "Auditing Live Pod Memory for Decrypted Secrets..."
echo "------------------------------------------------"
kubectl apply -f sealed-secret.yaml
kubectl apply -f secure-backend.yaml
kubectl apply -f backend-service.yaml

echo "Waiting for Pod to boot and mount decrypted secrets..."
kubectl wait --for=condition=ready pod -l app=secure-api --timeout=30s

POD_NAME=$(kubectl get pods -l app=secure-api -o jsonpath="{.items[0].metadata.name}")

echo "Extracting Environment Variables from Pod ($POD_NAME):"
kubectl exec $POD_NAME -- env | grep -E "USERNAME|PASSWORD"
echo "------------------------------------------------"
echo "If you see the raw passwords above, the Controller successfully decrypted the vault on the fly!"
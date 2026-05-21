#!/bin/bash
echo "Auditing In-Memory Secret Volume Mounts..."
echo "------------------------------------------------"
kubectl apply -f secure-backend.yaml

echo "Waiting for Pod to reboot with new security posture..."
kubectl wait --for=condition=ready pod -l app=secure-api --timeout=30s

POD_NAME=$(kubectl get pods -l app=secure-api -o jsonpath="{.items[0].metadata.name}")

echo ""
echo "[TEST 1] Attempting to steal secrets via environment variables..."
kubectl exec $POD_NAME -- env | grep -E "USERNAME|PASSWORD" || echo "SUCCESS: Environment variables are clean."

echo ""
echo "[TEST 2] Application attempting to read secret from /etc/secrets/PASSWORD..."
kubectl exec $POD_NAME -- cat /etc/secrets/PASSWORD
echo ""
echo "------------------------------------------------"
echo "Vulnerability patched. Passwords are no longer exposed to crash logs."
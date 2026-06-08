#!/bin/bash
echo "Auditing Injected Dynamic Credentials..."
echo "-------------------------------------------------------------"
POD_NAME=$(kubectl get pod -l app=secure-api -o jsonpath='{.items[0].metadata.name}')

echo "Reading the memory-backed Vault mount inside the container:"
kubectl exec $POD_NAME -c app -- cat /vault/secrets/database-config.txt
echo ""
echo "-------------------------------------------------------------"
echo "Notice the username and password! They are completely random and will self-destruct in 1 hour."
#!/bin/bash
echo "Auditing GitOps Secrets Synchronization..."
echo "--------------------------------------------------------"
echo ">>> [1/2] Verifying Native K8s Secret Generation:"
kubectl get secret native-db-secret
echo ""

echo ">>> [2/2] Extracting Application Execution Logs:"
kubectl logs secure-mlops-backend
echo "--------------------------------------------------------"
echo "If the pod successfully printed the 'SuperSecretQuantumPassword3000!', the operator successfully bridged the air-gap."
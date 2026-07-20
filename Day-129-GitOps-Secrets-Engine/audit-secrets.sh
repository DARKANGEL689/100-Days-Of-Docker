#!/bin/bash
echo "Auditing Autonomous Vault Synchronization..."
echo "--------------------------------------------------------"

echo "[1] Querying ExternalSecret Status (The GitOps Request):"
kubectl get externalsecrets.external-secrets.io sync-enterprise-db-password
echo ""

echo "[2] Validating Autonomously Synthesized Native K8s Secret:"
kubectl describe secret enterprise-db-credentials

echo "--------------------------------------------------------"
echo "If the ExternalSecret shows 'SecretSynced', your architecture is perfectly abstracted."
echo "If you rotate the password in AWS, ESO will automatically update 'enterprise-db-credentials' within 60 seconds."
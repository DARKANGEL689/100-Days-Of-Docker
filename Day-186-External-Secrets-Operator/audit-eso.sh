#!/bin/bash
echo "Auditing Autonomous Secret Materialization..."
echo "--------------------------------------------------------"

echo ">>> [1/2] Verifying Native Secret Generation:"
echo "ESO should have autonomously created 'ai-vault-secret'. Checking existence..."
kubectl get secret ai-vault-secret
echo ""

echo ">>> [2/2] Extracting in-memory Environment Variables from Secure Workload:"
POD_NAME=$(kubectl get pods -l app=ai-worker -o jsonpath='{.items[0].metadata.name}')

echo "Executing shell command inside pod $POD_NAME..."
echo "Database Password: $(kubectl exec $POD_NAME -- printenv DATABASE_PASSWORD)"
echo "OpenAI API Key:    $(kubectl exec $POD_NAME -- printenv OPENAI_API_KEY)"
echo "--------------------------------------------------------"
echo "Zero static passwords exist in your Git repository. The payload was seamlessly synchronized from the vault to the container."
#!/bin/bash
echo "Locating Database Pod..."
POD_NAME=$(kubectl get pods -l app=database -o jsonpath="{.items[0].metadata.name}")

echo "Writing critical transaction data to persistent volume inside $POD_NAME..."
kubectl exec $POD_NAME -- sh -c 'echo "USER_BALANCES: \$1,000,000" > /var/lib/postgresql/data/ledger.txt'

echo "Data written successfully. Verifying:"
kubectl exec $POD_NAME -- cat /var/lib/postgresql/data/ledger.txt
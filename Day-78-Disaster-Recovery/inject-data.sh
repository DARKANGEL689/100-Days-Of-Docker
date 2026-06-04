#!/bin/bash
echo "Injecting financial records into the Persistent Volume..."
POD_NAME=$(kubectl get pod -l app=finance-db -o jsonpath='{.items[0].metadata.name}')

kubectl exec $POD_NAME -- /bin/sh -c "echo 'ACCOUNT: 8675309 | BALANCE: \$50,000,000 | STATUS: CLASSIFIED' > /data/ledger.txt"

echo "Data injected. Verifying file exists on the disk:"
kubectl exec $POD_NAME -- cat /data/ledger.txt
#!/bin/bash
echo "Auditing Resurrected Database for Data Integrity..."
echo "---------------------------------------------------"
POD_NAME=$(kubectl get pod -l app=finance-db -o jsonpath='{.items[0].metadata.name}')

echo "Reading /data/ledger.txt from resurrected Persistent Volume:"
kubectl exec $POD_NAME -- cat /data/ledger.txt
echo "---------------------------------------------------"
echo "If you see the $50,000,000 balance above, your Disaster Recovery pipeline is FLAWLESS."
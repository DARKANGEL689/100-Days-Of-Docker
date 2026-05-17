#!/bin/bash
NEW_POD=$(kubectl get pods -l app=database -o jsonpath="{.items[0].metadata.name}")
echo "Interrogating new pod ($NEW_POD) for persistent data..."
echo "------------------------------------------------------"
kubectl exec $NEW_POD -- cat /var/lib/postgresql/data/ledger.txt || echo "CATASTROPHIC DATA LOSS."
echo "------------------------------------------------------"
echo "If you see the $1,000,000 balance, the persistent volume dynamically reattached!"
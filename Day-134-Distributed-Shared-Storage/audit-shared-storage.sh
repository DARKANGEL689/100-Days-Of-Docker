#!/bin/bash
echo "Auditing ReadWriteMany (RWX) Distributed File Concurrency..."
echo "--------------------------------------------------------"

ALPHA_POD=$(kubectl get pods -l app=ingester-alpha -o jsonpath='{.items[0].metadata.name}')

echo "Executing cat on /data/shared_ledger.log from inside Alpha Pod:"
echo ""

kubectl exec $ALPHA_POD -- tail -n 10 /data/shared_ledger.log

echo ""
echo "--------------------------------------------------------"
echo "If you see BOTH [ALPHA] and [BETA] lines in the output, you have successfully engineered a distributed POSIX file system."
echo "Your entire cluster can now read and write to the same infinite directory simultaneously."
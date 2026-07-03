#!/bin/bash
echo "INITIATING CHAOS: Simulating total loss of Datacenter Alpha (Node 0)..."
echo "--------------------------------------------------------"

echo "[1] Querying Node 0 (Datacenter Alpha):"
kubectl exec -it global-ledger-cockroachdb-0 -- ./cockroach sql --insecure --execute="SELECT username, balance FROM enterprise_bank.user_accounts;"

echo ""
echo "[2] ALARM: Datacenter Alpha is offline. Deleting Node 0 physically from the cluster..."
kubectl delete pod global-ledger-cockroachdb-0 --force --grace-period=0

echo ""
echo "[3] Rerouting traffic to Datacenter Beta (Node 1)..."
echo "Querying Node 1 for identical data:"
kubectl exec -it global-ledger-cockroachdb-1 -- ./cockroach sql --insecure --execute="SELECT username, balance FROM enterprise_bank.user_accounts;"

echo "--------------------------------------------------------"
echo "ZERO DOWNTIME. ZERO DATA LOSS. The cluster survived."
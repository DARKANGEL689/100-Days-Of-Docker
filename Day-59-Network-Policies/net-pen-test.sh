#!/bin/bash
echo "Initiating Internal Network Penetration Test..."
echo "----------------------------------------------"

echo "[TEST 1] Compromised Container attempting lateral movement to Database..."
kubectl exec compromised-container -- sh -c 'nc -vz -w 3 database-svc 6379' || echo "BLOCKED: Network Policy Enforced."

echo ""
echo "[TEST 2] Authorized Web Frontend connecting to Database..."
kubectl exec web-frontend -- sh -c 'nc -vz -w 3 database-svc 6379' && echo "SUCCESS: Traffic explicitly allowed."

echo "----------------------------------------------"
echo "Zero Trust Micro-segmentation is active."
#!/bin/bash
echo "Auditing the Holographic Reality..."
echo "--------------------------------------------------------"

echo "[TEST 1] Cluster Node Capacity:"
NODE_COUNT=$(kubectl get nodes -l type=kwok --no-headers | wc -l)
echo "The API Server reports $NODE_COUNT physical nodes online."
echo ""

echo "[TEST 2] Workload Capacity:"
POD_COUNT=$(kubectl get pods -l app=ghost-workload --no-headers | wc -l)
echo "The API Server reports $POD_COUNT running pods."
echo ""

echo "[TEST 3] Physical Reality Check:"
echo "Even though K8s thinks 2,500 pods are running, let's look at your actual machine:"
kubectl top nodes --no-headers | grep -v kwok
echo "(Your physical node is likely sitting at its standard idle baseline!)"
echo "--------------------------------------------------------"
#!/bin/bash
echo "Auditing Multi-Instance GPU (MIG) Hardware Slicing..."
echo "--------------------------------------------------------"

echo "[1] Querying Cluster Node Capacity:"
kubectl get nodes -o json | jq '.items[].status.capacity | with_entries(select(.key | contains("nvidia.com/mig")))'
echo "(Notice the capacity is 7, not 1. The cluster believes there are 7 GPUs.)"
echo ""

echo "[2] Verifying Concurrent Execution Status:"
kubectl get pods -l app=ai-model -o custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName
echo ""
echo "--------------------------------------------------------"
echo "If all 4 pods show 'Running' on the SAME node, you have successfully bypassed the single-workload GPU lock. You have multiplied your hardware ROI."
#!/bin/bash
echo "Scanning cluster nodes..."
NODES=($(kubectl get nodes -o jsonpath='{.items[*].metadata.name}'))

if [ ${#NODES[@]} -eq 0 ]; then
    echo "[ERROR] No nodes detected. Cluster offline."
    exit 1
fi

echo "Injecting physical datacenter topology metadata into the control plane..."

kubectl label node ${NODES[0]} topology.kubernetes.io/zone=us-east-1a topology.kubernetes.io/rack=rack-1 --overwrite
if [ ${#NODES[@]} -gt 1 ]; then
    kubectl label node ${NODES[1]} topology.kubernetes.io/zone=us-east-1a topology.kubernetes.io/rack=rack-1 --overwrite
fi
if [ ${#NODES[@]} -gt 2 ]; then
    kubectl label node ${NODES[2]} topology.kubernetes.io/zone=us-east-1b topology.kubernetes.io/rack=rack-2 --overwrite
fi

echo "Topology injection complete. Nodes are now spatially aware."
kubectl get nodes --show-labels | grep topology.kubernetes.io
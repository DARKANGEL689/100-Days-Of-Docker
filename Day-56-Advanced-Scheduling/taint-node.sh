#!/bin/bash
echo "Locating cluster node..."
NODE_NAME=$(kubectl get nodes -o jsonpath='{.items[0].metadata.name}')

echo "Applying 'Dedicated=Database' Taint to $NODE_NAME with NoSchedule effect..."
kubectl taint nodes $NODE_NAME hardware-class=database:NoSchedule

echo "Node is now repelling standard workloads."
kubectl describe node $NODE_NAME | grep Taints

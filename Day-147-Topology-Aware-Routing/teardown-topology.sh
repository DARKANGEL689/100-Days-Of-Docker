#!/bin/bash
echo "Executing clean teardown of Day 147 Architecture..."
kubectl delete -f 2-topology-compute.yaml --ignore-not-found
kubectl delete -f 3-zone-service.yaml --ignore-not-found

echo "Stripping physical topology labels from cluster nodes..."
NODES=($(kubectl get nodes -o jsonpath='{.items[*].metadata.name}'))
for NODE in "${NODES[@]}"; do
    kubectl label node $NODE topology.kubernetes.io/zone- topology.kubernetes.io/rack- --ignore-not-found
done

echo "Teardown complete. Spatial metadata purged."
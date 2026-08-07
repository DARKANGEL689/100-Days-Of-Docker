#!/bin/bash
echo "Auditing Physical Pod Topology..."
echo "--------------------------------------------------------"

echo "[1] Analyzing Pod Placements & Node Bindings:"
kubectl get pods -l app=tensor-engine -o custom-columns="POD:.metadata.name,NODE:.spec.nodeName,STATUS:.status.phase"

echo ""
echo "[2] Analyzing Physical Node Topologies:"
NODES=$(kubectl get pods -l app=tensor-engine -o jsonpath='{.items[*].spec.nodeName}' | tr ' ' '\n' | sort -u)

for NODE in $NODES; do
    RACK=$(kubectl get node $NODE -o jsonpath='{.metadata.labels.topology\.kubernetes\.io/rack}')
    ZONE=$(kubectl get node $NODE -o jsonpath='{.metadata.labels.topology\.kubernetes\.io/zone}')
    echo "Node: $NODE is physically located in Zone: [$ZONE], Rack: [$RACK]"
done

echo "--------------------------------------------------------"
echo "If all compute pods are localized to the same node/rack, zero-hop scheduling was successful."
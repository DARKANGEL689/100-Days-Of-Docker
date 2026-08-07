#!/bin/bash
echo "Executing Datacenter Metadata Injection..."
./1-label-infrastructure.sh

echo "Deploying Latency-Optimized Topology Service..."
kubectl apply -f 3-zone-service.yaml

echo "Provisioning Rack-Affinity Compute Matrix..."
kubectl apply -f 2-topology-compute.yaml

echo "Waiting for control plane to calculate node spatial distribution and schedule workloads..."
sleep 5
kubectl wait --for=condition=available deployment/distributed-tensor-workers --timeout=120s

echo "Topology Matrix ONLINE. Compute pods are physically grouped."
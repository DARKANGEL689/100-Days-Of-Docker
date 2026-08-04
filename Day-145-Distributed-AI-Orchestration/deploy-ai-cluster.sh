#!/bin/bash
echo "Provisioning the RayCluster Topology (Head Node + 3 Worker Nodes)..."
kubectl apply -f 1-ray-cluster.yaml

echo "Waiting for the distributed AI grid to boot and synchronize..."
sleep 5
kubectl wait --for=condition=ready pod -l ray.io/node-type=head --timeout=120s
kubectl wait --for=condition=ready pod -l ray.io/node-type=worker --timeout=120s

echo "Submitting Distributed Training Job to the Ray Global Control Store..."
kubectl apply -f 2-ray-training-job.yaml

echo "AI Supercomputer is ACTIVE. Python actors are currently distributing across the fleet."
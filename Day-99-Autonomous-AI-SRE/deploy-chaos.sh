#!/bin/bash
echo "Deploying critically misconfigured architecture to the cluster..."
kubectl apply -f 1-chaos-workload.yaml
kubectl apply -f 2-broken-network.yaml

echo "Waiting for the cluster to start throwing errors..."
sleep 5
kubectl get pods
echo "The architecture is broken. A human would take 30 minutes to find all 4 root causes."
#!/bin/bash
echo "Executing Emergency Abort. Halting all Chaos Experiments..."
kubectl delete -f 5-cpu-burn.yaml --ignore-not-found
kubectl delete -f 4-network-latency.yaml --ignore-not-found
kubectl delete -f 3-pod-assassin.yaml --ignore-not-found
kubectl delete -f 2-routing-service.yaml --ignore-not-found
kubectl delete -f 1-resilient-deployment.yaml --ignore-not-found
echo "Teardown complete. The cluster is safe."
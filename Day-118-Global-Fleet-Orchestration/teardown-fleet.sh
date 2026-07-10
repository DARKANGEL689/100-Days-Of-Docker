#!/bin/bash
echo "Executing clean teardown of Day 118 Architecture..."
kubectl delete -f 3-cluster-override.yaml --ignore-not-found
kubectl delete -f 2-propagation-policy.yaml --ignore-not-found
kubectl delete -f 1-global-workload.yaml --ignore-not-found
echo "Policies purged. Global workload recalled."
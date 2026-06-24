#!/bin/bash
echo "Executing clean teardown of Day 99 Architecture..."
kubectl delete -f 2-broken-network.yaml --ignore-not-found
kubectl delete -f 1-chaos-workload.yaml --ignore-not-found
echo "Teardown complete."
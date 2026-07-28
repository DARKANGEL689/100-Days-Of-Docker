#!/bin/bash
echo "Executing clean teardown of Day 137 Architecture..."
kubectl delete -f 2-keda-worker-architecture.yaml --ignore-not-found
kubectl delete -f 1-redis-broker.yaml --ignore-not-found
echo "Teardown complete. External metric endpoints decoupled."
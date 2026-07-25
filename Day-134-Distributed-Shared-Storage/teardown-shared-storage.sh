#!/bin/bash
echo "Executing clean teardown of Day 134 Architecture..."
kubectl delete -f 3-distributed-workload.yaml --ignore-not-found
kubectl delete -f 2-juicefs-system.yaml --ignore-not-found
kubectl delete -f 1-storage-backends.yaml --ignore-not-found
echo "Teardown complete. File handles released. Caches cleared."
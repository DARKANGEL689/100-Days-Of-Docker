#!/bin/bash
echo "Executing clean teardown of Day 146 Architecture..."
kubectl delete -f 2-cached-training-loop.yaml --ignore-not-found
kubectl delete -f 1-alluxio-storage.yaml --ignore-not-found
echo "Teardown complete. Cache allocations released. Caches flushed."
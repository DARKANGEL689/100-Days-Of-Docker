#!/bin/bash
echo "Executing clean teardown of Day 113 Architecture..."
kubectl delete -f 4-grid-client-job.yaml --ignore-not-found
kubectl delete -f 3-grid-client-logic.yaml --ignore-not-found
kubectl delete -f 2-hazelcast-cluster.yaml --ignore-not-found
kubectl delete -f 1-hazelcast-rbac.yaml --ignore-not-found
echo "Teardown complete. Grid memory flushed."
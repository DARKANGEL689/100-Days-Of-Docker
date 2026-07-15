#!/bin/bash
echo "Executing clean teardown of Day 123 Architecture..."
kubectl delete -f 1-cpu-anomaly-workload.yaml --ignore-not-found
echo "Teardown complete. Anomaly purged. Profiling agents remain active."
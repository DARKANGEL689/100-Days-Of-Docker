#!/bin/bash
echo "Executing clean teardown of Day 138 Architecture..."
kubectl delete -f 2-destruction-protocol.yaml --ignore-not-found
kubectl delete -f 1-target-workload.yaml --ignore-not-found
echo "Teardown complete. Chaos experiments aborted. Peace restored."
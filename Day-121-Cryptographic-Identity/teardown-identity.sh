#!/bin/bash
echo "Executing clean teardown of Day 121 Architecture..."
kubectl delete -f 3-secure-workload.yaml --ignore-not-found
kubectl delete -f 1-spiffe-csi.yaml --ignore-not-found
echo "Teardown complete. Identities flushed."
#!/bin/bash
echo "Executing clean teardown of Day 90 Architecture..."
kubectl delete -f 2-vm-service.yaml --ignore-not-found
kubectl delete -f 1-legacy-vm.yaml --ignore-not-found
echo "Teardown complete. KubeVirt Operator remains active."
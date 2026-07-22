#!/bin/bash
echo "Executing clean teardown of Day 131 Architecture..."
kubectl delete -f 2-secure-workload.yaml --ignore-not-found
kubectl delete -f 1-kata-runtime.yaml --ignore-not-found
echo "Teardown complete. MicroVMs terminated. Hypervisor resources released."
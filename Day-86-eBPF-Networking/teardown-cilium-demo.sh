#!/bin/bash
echo "Executing clean teardown of Day 86 Architecture..."
kubectl delete -f 3-ebpf-policy.yaml --ignore-not-found
kubectl delete -f 2-client-pods.yaml --ignore-not-found
kubectl delete -f 1-payroll-api.yaml --ignore-not-found
echo "Teardown complete. Cilium eBPF Engine remains active in the Kernel."
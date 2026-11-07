#!/bin/bash
echo "Executing clean teardown of Day 209 Architecture..."
kubectl delete -f 2-ebpf-tracing-policy.yaml --ignore-not-found
kubectl delete -f 1-target-workload.yaml --ignore-not-found
helm uninstall tetragon -n kube-system
echo "Teardown complete. eBPF kernel hooks detached."
#!/bin/bash
echo "Executing clean teardown of Day 168 Architecture..."
kubectl delete -f 2-tetragon-policy.yaml --ignore-not-found
kubectl delete -f 1-vulnerable-workload.yaml --ignore-not-found
helm uninstall tetragon -n kube-system
kubectl delete namespace kube-system --ignore-not-found
echo "Teardown complete. Kernel hooks detached."
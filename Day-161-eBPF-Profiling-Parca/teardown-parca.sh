#!/bin/bash
echo "Executing clean teardown of Day 161 Architecture..."
kubectl delete -f 1-cpp-algorithmic-burner.yaml --ignore-not-found
helm uninstall parca -n parca
kubectl delete namespace parca --ignore-not-found
echo "Teardown complete. eBPF hooks detached from the kernel."
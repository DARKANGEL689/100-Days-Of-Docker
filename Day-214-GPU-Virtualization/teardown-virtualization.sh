#!/bin/bash
echo "Executing clean teardown of Day 214 Architecture..."
kubectl delete -f 2-parallel-ai-agents.yaml --ignore-not-found
helm uninstall nvdp -n kube-system
kubectl delete -f 1-gpu-virtualization-config.yaml --ignore-not-found
echo "Teardown complete. GPU time-slicing revoked. Physical hardware limits restored."
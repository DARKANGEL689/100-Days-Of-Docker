#!/bin/bash
echo "Executing clean teardown of Day 169 Architecture..."
kubectl delete -f 2-fractional-ai-workloads.yaml --ignore-not-found
kubectl delete -f 1-gpu-slicing-config.yaml --ignore-not-found
echo "Teardown complete. GPU virtual slices collapsed."
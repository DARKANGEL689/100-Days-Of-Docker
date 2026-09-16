#!/bin/bash
echo "Executing clean teardown of Day 182 Architecture..."
kubectl delete -f 1-vllm-deployment.yaml --ignore-not-found
echo "Teardown complete. PagedAttention KV caches flushed from silicon memory."
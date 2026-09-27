#!/bin/bash
echo "Executing clean teardown of Day 192 Architecture..."
kubectl delete -f 1-vllm-multilora.yaml --ignore-not-found
echo "Teardown complete. PagedAttention and LoRA registries flushed."
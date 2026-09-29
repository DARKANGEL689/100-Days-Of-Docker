#!/bin/bash
echo "Executing clean teardown of Day 193 Architecture..."
kubectl delete -f 2-llm-gateway.yaml --ignore-not-found
kubectl delete -f 1-redis-cache.yaml --ignore-not-found
echo "Teardown complete. Cache hashes flushed from memory."
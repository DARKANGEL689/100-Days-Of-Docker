#!/bin/bash
echo "Executing clean teardown of Day 213 Architecture..."
kubectl delete -f 3-keda-scaler.yaml --ignore-not-found
kubectl delete -f 2-ai-worker-node.yaml --ignore-not-found
kubectl delete -f 1-redis-queue.yaml --ignore-not-found
helm uninstall keda -n keda
kubectl delete namespace keda --ignore-not-found
echo "Teardown complete. Event-driven proxies detached."
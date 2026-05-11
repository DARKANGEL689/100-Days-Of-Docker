#!/bin/bash
echo "Executing clean teardown of Day 56 Architecture..."
kubectl delete daemonset global-security-logger
kubectl delete pod standard-web-app critical-database-pod high-speed-cache --ignore-not-found
kubectl delete deployment smart-api-backend
NODE_NAME=$(kubectl get nodes -o jsonpath='{.items[0].metadata.name}')
kubectl label nodes $NODE_NAME disk-tier-
echo "Architecture terminated. Hardware labels scrubbed."

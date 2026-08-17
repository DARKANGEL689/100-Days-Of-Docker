#!/bin/bash
echo "Executing clean teardown of Day 158 Architecture..."
kubectl delete -f 2-feature-server.yaml --ignore-not-found
kubectl delete -f 1-redis-online-store.yaml --ignore-not-found
echo "Teardown complete. Feature caches flushed."
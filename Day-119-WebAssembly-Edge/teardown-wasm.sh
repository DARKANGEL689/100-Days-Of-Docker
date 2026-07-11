#!/bin/bash
echo "Executing clean teardown of Day 119 Architecture..."
kubectl delete -f 2-wasm-deployment.yaml --ignore-not-found
kubectl delete -f 1-wasm-runtime.yaml --ignore-not-found
echo "Teardown complete. Wasm modules purged."
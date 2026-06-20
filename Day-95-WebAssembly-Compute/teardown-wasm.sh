#!/bin/bash
echo "Executing clean teardown of Day 95 Architecture..."
kubectl delete -f 2-wasm-service.yaml --ignore-not-found
kubectl delete -f 1-wasm-workload.yaml --ignore-not-found
echo "Teardown complete. KWasm Operator and Node runtime remain active."
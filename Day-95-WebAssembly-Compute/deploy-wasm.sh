#!/bin/bash
echo "Deploying the pure WebAssembly binary to the cluster..."
kubectl apply -f 1-wasm-workload.yaml
kubectl apply -f 2-wasm-service.yaml

echo "Waiting for the WasmEdge Shim to compile and execute the binary..."
kubectl wait --for=condition=available deployment/hyper-speed-wasm-api --timeout=60s

echo "WebAssembly workload is ONLINE."
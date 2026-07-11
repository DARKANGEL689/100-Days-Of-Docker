#!/bin/bash
echo "Registering Wasm RuntimeClass into Kubernetes API..."
kubectl apply -f 1-wasm-runtime.yaml

echo "Deploying WebAssembly Microservice Payload..."
kubectl apply -f 2-wasm-deployment.yaml

echo "Waiting for Sub-Millisecond Wasm Instantiation..."
sleep 2
kubectl wait --for=condition=available deployment/enterprise-wasm-api --timeout=60s

echo "WebAssembly API is ONLINE. Executing outside of standard container boundaries."
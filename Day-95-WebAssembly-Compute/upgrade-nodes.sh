#!/bin/bash
echo "Authorizing KWasm Operator to upgrade the physical node architecture..."

kubectl annotate node --all kwasm.sh/kwasm-node=true

echo "Waiting for the Wasm Shim to be injected into the container runtime..."
sleep 15

echo "Validating the new RuntimeClasses..."
kubectl get runtimeclasses
echo "--------------------------------------------------------"
echo "If you see 'wasmedge' or 'wasmtime' in the list above, your cluster is now Wasm-capable!"
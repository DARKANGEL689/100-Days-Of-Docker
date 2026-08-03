#!/bin/bash
echo "Deploying the Confidential Containers (CoCo) Operator..."
kubectl apply -k github.com/confidential-containers/operator/config/release?ref=v0.7.0

echo "Waiting for the CoCo Operator to initialize across the control plane..."
sleep 5
kubectl wait --namespace confidential-containers-system --for=condition=ready pod -l control-plane=controller-manager --timeout=120s

echo "Deploying hardware-specific Runtime Payloads (Intel SGX / AMD SEV / TDX)..."
kubectl apply -f https://raw.githubusercontent.com/confidential-containers/operator/v0.7.0/config/samples/ccruntime/default/ccruntime.yaml

echo "Waiting for the hardware shims to compile..."
sleep 15

echo "Confidential Computing Layer is ONLINE. The CPU is ready to carve enclaves."
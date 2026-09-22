#!/bin/bash
echo "Executing clean teardown of Day 189 Architecture..."
kubectl delete -f 1-wasm-workload.yaml --ignore-not-found

echo "Removing Wasm Shims from Nodes..."
kubectl annotate node --all kwasm.sh/kwasm-node-
sleep 15 

helm uninstall kwasm-operator -n kwasm
kubectl delete namespace kwasm --ignore-not-found
echo "Teardown complete. Containerd runtime restored to standard Linux execution."
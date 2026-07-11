#!/bin/bash
echo "Installing KWasm Operator Helm Repository..."
helm repo add kwasm http://kwasm.sh/kwasm-operator/
helm repo update

echo "Deploying KWasm Operator to the Control Plane..."
helm install kwasm-operator kwasm/kwasm-operator \
  --namespace kwasm \
  --create-namespace

echo "Waiting for the Operator to initialize..."
kubectl wait --namespace kwasm --for=condition=ready pod -l app.kubernetes.io/name=kwasm-operator --timeout=120s

echo "Annotating Worker Nodes to inject WebAssembly Shims..."
kubectl annotate node --all kwasm.sh/kwasm-node=true

echo "KWasm is ONLINE. The nodes are now capable of executing Wasm binaries natively."
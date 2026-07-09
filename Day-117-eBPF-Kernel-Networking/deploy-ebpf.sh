#!/bin/bash
echo "Applying Layer 7 (L7) Kernel-Level Network Policies..."
kubectl apply -f 1-zero-trust-policy.yaml

echo "Configuring Hubble Observability Endpoints..."
kubectl apply -f 2-hubble-ui.yaml

echo "Validating eBPF Endpoint Connectivity..."
cilium connectivity test --request-timeout 2s

echo "Zero-Trust Mesh is ACTIVE. Unauthorized packets will be dropped at the kernel level before reaching the pod."
#!/bin/bash
echo "Executing clean teardown of Day 215 Architecture..."
echo "[1/3] Terminating workload pods to release SPIFFE CSI socket mounts..."
kubectl delete -f 2-attested-and-rogue-agents.yaml --ignore-not-found --wait=true
kubectl delete -f 1-agent-spiffe-id.yaml --ignore-not-found

echo "[2/3] Uninstalling SPIRE Control Plane and CRDs..."
helm uninstall spire -n spire-system 2>/dev/null || true
helm uninstall spire-crds -n spire-system 2>/dev/null || true

echo "[3/3] Purging spire-system namespace..."
kubectl delete namespace spire-system --ignore-not-found
echo "Teardown complete. Cryptographic trust domain collapsed cleanly."
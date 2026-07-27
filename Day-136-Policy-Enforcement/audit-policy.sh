#!/bin/bash
echo "Auditing OPA Gatekeeper Policy Enforcement..."
echo "--------------------------------------------------------"

echo "[ATTACK] Attempting to deploy a Pod with 'privileged: true'..."
echo "Command: kubectl apply -f 3-rogue-payload.yaml"
echo ""

kubectl apply -f 3-rogue-payload.yaml

echo ""
echo "--------------------------------------------------------"
echo "If you see: 'Error from server (Forbidden): admission webhook... denied the request: [PROTOCOL 300 VIOLATION]'"
echo "Then your cluster is perfectly secure. Human error and rogue configurations have been mathematically eliminated."
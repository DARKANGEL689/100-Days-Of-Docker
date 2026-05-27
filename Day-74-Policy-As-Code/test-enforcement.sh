#!/bin/bash
echo "Applying Enterprise Policy Templates and Constraints..."
kubectl apply -f 1-template-block-latest.yaml
kubectl apply -f 2-constraint-block-latest.yaml

echo "Waiting 10 seconds for the Gatekeeper Webhooks to synchronize..."
sleep 10

echo "--------------------------------------------------------"
echo "[TEST 1] Attempting to deploy Rogue Pod (nginx:latest)..."
kubectl apply -f 3-rogue-pod.yaml
echo "--------------------------------------------------------"

echo ""
echo "[TEST 2] Attempting to deploy Compliant Pod (nginx:1.25.4)..."
kubectl apply -f 4-compliant-pod.yaml
echo "--------------------------------------------------------"
#!/bin/bash
echo "Auditing Algorithmic Canary Promotion..."
echo "--------------------------------------------------------"

echo "[1] Triggering Code Update (Updating image from 1.24 to 1.25)..."
kubectl argo rollouts set image enterprise-payment-api payment-api=nginx:1.25-alpine

echo ""
echo "[2] Monitoring the Progressive Delivery Matrix in Real-Time:"
echo "(Watch the CLI carefully. You will see the weight hit 20%, the Analysis run, and then the final promotion to 100%)."
echo "--------------------------------------------------------"

kubectl argo rollouts get rollout enterprise-payment-api --watch
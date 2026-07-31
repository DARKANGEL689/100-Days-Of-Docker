#!/bin/bash
echo "Auditing GitOps Continuous Self-Healing..."
echo "--------------------------------------------------------"

echo "[ATTACK] Rogue Administrator manually deleting the production deployment..."
kubectl delete deployment guestbook-ui

echo ""
echo "Deployment destroyed. Monitoring ArgoCD Drift Detection..."
echo "--------------------------------------------------------"

kubectl get deployments -w

echo "--------------------------------------------------------"
echo "Press CTRL+C when you see the deployment reappear."
echo "You have successfully eliminated configuration drift. Manual cluster tampering is now mathematically futile."
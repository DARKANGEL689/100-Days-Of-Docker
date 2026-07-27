#!/bin/bash
echo "Adding OPA Gatekeeper Helm Repository..."
helm repo add gatekeeper https://open-policy-agent.github.io/gatekeeper/charts
helm repo update

echo "Deploying the OPA Gatekeeper Policy Engine..."
helm install gatekeeper gatekeeper/gatekeeper \
  --namespace gatekeeper-system \
  --create-namespace

echo "Waiting for the Policy Engine webhooks to integrate with the Kubernetes API..."
kubectl wait --namespace gatekeeper-system --for=condition=ready pod -l control-plane=controller-manager --timeout=120s

echo "OPA Gatekeeper is ONLINE. The API server is now actively filtering structural definitions."
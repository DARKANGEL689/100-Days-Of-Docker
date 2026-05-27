#!/bin/bash
echo "Adding Open Policy Agent (OPA) Gatekeeper Repository..."
helm repo add gatekeeper https://open-policy-agent.github.io/gatekeeper/charts
helm repo update

echo "Deploying Gatekeeper Admission Controller..."
helm install gatekeeper gatekeeper/gatekeeper \
  --namespace gatekeeper-system \
  --create-namespace \
  --set auditInterval=10

echo "Waiting for the Policy Engine to boot..."
kubectl wait --namespace gatekeeper-system \
  --for=condition=ready pod \
  --selector=control-plane=controller-manager \
  --timeout=120s

echo "OPA Gatekeeper is ONLINE. The API Firewall is active."
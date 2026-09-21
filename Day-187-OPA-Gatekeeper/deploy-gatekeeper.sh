#!/bin/bash
echo "[INIT] Adding Open Policy Agent (OPA) Gatekeeper Helm Repository..."
helm repo add gatekeeper https://open-policy-agent.github.io/gatekeeper/charts
helm repo update

echo "[DEPLOY] Provisioning OPA Gatekeeper Admission Webhooks..."
helm upgrade --install gatekeeper gatekeeper/gatekeeper \
  --namespace gatekeeper-system \
  --create-namespace \
  --wait

echo "[DEPLOY] Injecting Rego Constraint Template (Logic)..."
kubectl apply -f 1-constraint-template.yaml
sleep 5 

echo "[DEPLOY] Enforcing Global Resource Limit Policy (Binding)..."
kubectl apply -f 2-enforce-limits.yaml
sleep 5

echo "Policy-as-Code Matrix is ARMED. All inbound deployments are now under strict mathematical scrutiny."
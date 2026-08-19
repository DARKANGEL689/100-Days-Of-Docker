#!/bin/bash
echo "[INIT] Installing CNCF Kyverno Policy Engine via Helm..."
helm repo add kyverno https://kyverno.github.io/kyverno/
helm repo update
helm upgrade --install kyverno kyverno/kyverno \
  --namespace kyverno \
  --create-namespace \
  --set admissionController.replicas=1 \
  --wait

echo "[WAIT] Aligning Mutating Admission Webhook TLS registrations..."
sleep 15
kubectl wait --for=condition=ready pod -l app.kubernetes.io/component=admission-controller -n kyverno --timeout=120s

echo "[DEPLOY] Injecting MLOps ClusterPolicy to API Server..."
kubectl apply -f 1-mutating-policy.yaml

echo "Dynamic Policy Enforcement matrix is ARMED. API requests will now be intercepted."
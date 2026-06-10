#!/bin/bash
echo "Adding Kyverno Helm Repository..."
helm repo add kyverno https://kyverno.github.io/kyverno/
helm repo update

echo "Deploying Kyverno Policy Engine..."
helm install kyverno kyverno/kyverno \
  --namespace kyverno \
  --create-namespace \
  --set admissionController.replicas=1

echo "Downloading Cosign (Sigstore) Engine for Windows..."
curl -sLO https://github.com/sigstore/cosign/releases/latest/download/cosign-windows-amd64.exe
mv cosign-windows-amd64.exe cosign.exe
chmod +x cosign.exe

echo "Waiting for Kyverno Admission Webhooks to boot..."
kubectl wait --namespace kyverno --for=condition=ready pod -l app.kubernetes.io/component=admission-controller --timeout=120s
echo "Supply Chain Defense Systems are ONLINE."
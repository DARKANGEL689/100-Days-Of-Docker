#!/bin/bash
echo "Adding Kyverno Helm Repository..."
helm repo add kyverno https://kyverno.github.io/kyverno/
helm repo update

echo "Deploying the Kyverno Admission Controller..."
helm install policy-engine kyverno/kyverno \
  --namespace kyverno \
  --create-namespace \
  --set replicaCount=1

echo "Waiting for the Policy Engine to integrate with the K8s API..."
kubectl wait --namespace kyverno --for=condition=ready pod -l app.kubernetes.io/name=kyverno --timeout=120s

echo "Kyverno is ONLINE. The cluster is now inspecting every incoming payload."
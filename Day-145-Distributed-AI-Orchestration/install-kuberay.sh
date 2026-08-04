#!/bin/bash
echo "Adding KubeRay Helm Repository..."
helm repo add kuberay https://ray-project.github.io/kuberay-helm/
helm repo update

echo "Deploying the KubeRay Operator to the Control Plane..."
helm install kuberay-operator kuberay/kuberay-operator \
  --namespace kuberay-system \
  --create-namespace

echo "Waiting for the AI Orchestrator to integrate with the Kubernetes API..."
kubectl wait --namespace kuberay-system --for=condition=ready pod -l app.kubernetes.io/name=kuberay-operator --timeout=120s

echo "KubeRay is ONLINE. The cluster is now capable of orchestrating distributed Ray actors."
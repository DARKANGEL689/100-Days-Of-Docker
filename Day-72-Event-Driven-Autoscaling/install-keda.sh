#!/bin/bash
echo "Adding KEDA Helm Repository..."
helm repo add kedacore https://kedacore.github.io/charts
helm repo update

echo "Deploying Kubernetes Event-driven Autoscaling (KEDA) Engine..."
helm install keda kedacore/keda \
  --namespace keda \
  --create-namespace

echo "Waiting for KEDA Operator to boot..."
kubectl wait --namespace keda \
  --for=condition=ready pod \
  --selector=app=keda-operator \
  --timeout=120s

echo "KEDA is ONLINE."
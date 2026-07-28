#!/bin/bash
echo "Adding KEDA Helm Repository..."
helm repo add kedacore https://kedacore.github.io/charts
helm repo update

echo "Deploying the Event-Driven Autoscaling Engine..."
helm install keda kedacore/keda \
  --namespace keda \
  --create-namespace

echo "Waiting for the KEDA Operator to initialize..."
kubectl wait --namespace keda --for=condition=ready pod -l app=keda-operator --timeout=120s

echo "KEDA is ONLINE. The cluster can now scale based on external metric events."
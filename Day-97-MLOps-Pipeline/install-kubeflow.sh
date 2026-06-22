#!/bin/bash
echo "Deploying Kubeflow Pipelines Control Plane..."
kubectl apply -k "github.com/kubeflow/pipelines/manifests/kustomize/cluster-scoped-resources?ref=2.0.5"
kubectl apply -k "github.com/kubeflow/pipelines/manifests/kustomize/env/dev?ref=2.0.5"

echo "Waiting for the ML Pipeline Engine to boot..."
kubectl wait --namespace kubeflow --for=condition=ready pod -l app=ml-pipeline --timeout=300s

echo "MLOps Pipeline Engine is ONLINE. The Factory is ready."
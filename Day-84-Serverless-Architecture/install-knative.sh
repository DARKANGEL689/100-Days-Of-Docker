#!/bin/bash
echo "Installing Knative Custom Resource Definitions (CRDs)..."
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.12.0/serving-crds.yaml

echo "Installing Knative Serving Core Engine..."
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.12.0/serving-core.yaml

echo "Installing Kourier Serverless Networking Layer..."
kubectl apply -f https://github.com/knative/net-kourier/releases/download/knative-v1.12.0/kourier.yaml

echo "Patching the cluster to route all serverless traffic through Kourier..."
kubectl patch configmap/config-network \
  --namespace knative-serving \
  --type merge \
  --patch '{"data":{"ingress-class":"kourier.ingress.networking.knative.dev"}}'

echo "Waiting for Serverless Control Plane to boot..."
kubectl wait --namespace knative-serving --for=condition=ready pod --all --timeout=120s
echo "Knative is ONLINE. Your cluster is now capable of True Serverless Compute."
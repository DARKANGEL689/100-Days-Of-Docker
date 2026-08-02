#!/bin/bash
echo "Deploying Knative Serving CRDs and Core Engine..."
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.11.0/serving-crds.yaml
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.11.0/serving-core.yaml

echo "Deploying Kourier (Serverless Ingress Gateway)..."
kubectl apply -f https://github.com/knative/net-kourier/releases/download/knative-v1.11.0/kourier.yaml

echo "Configuring Knative to route traffic through the Kourier Gateway..."
kubectl patch configmap/config-network \
  --namespace knative-serving \
  --type merge \
  --patch '{"data":{"ingress-class":"kourier.ingress.networking.knative.dev"}}'

echo "Waiting for the Serverless Control Plane to initialize..."
kubectl wait --namespace knative-serving --for=condition=ready pod -l app=controller --timeout=120s
kubectl wait --namespace knative-serving --for=condition=ready pod -l app=autoscaler --timeout=120s

echo "Knative is ONLINE. The cluster is now capable of instantaneous HTTP scaling."
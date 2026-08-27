#!/bin/bash
KNATIVE_VERSION="v1.11.0"

echo "[INIT] Provisioning Knative Serving CRDs and Core Control Plane..."
kubectl apply -f https://github.com/knative/serving/releases/download/${KNATIVE_VERSION}/serving-crds.yaml
kubectl apply -f https://github.com/knative/serving/releases/download/${KNATIVE_VERSION}/serving-core.yaml
sleep 15
kubectl wait --for=condition=ready pod -l app.kubernetes.io/component=controller -n knative-serving --timeout=120s

echo "[INIT] Provisioning Kourier Networking Gateway..."
kubectl apply -f https://github.com/knative/net-kourier/releases/download/${KNATIVE_VERSION}/kourier.yaml
kubectl patch configmap/config-network \
  --namespace knative-serving \
  --type merge \
  --patch '{"data":{"ingress-class":"kourier.ingress.networking.knative.dev"}}'

echo "[INIT] Configuring Magic DNS (sslip.io) for localized routing..."
kubectl apply -f https://github.com/knative/serving/releases/download/${KNATIVE_VERSION}/serving-default-domain.yaml
sleep 10

echo "[DEPLOY] Injecting Scale-to-Zero Serverless Workload..."
kubectl apply -f 1-serverless-inference.yaml

echo "Serverless Architecture is ARMED. Awaiting traffic..."
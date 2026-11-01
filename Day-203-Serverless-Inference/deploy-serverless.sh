#!/bin/bash
echo "[INIT] Provisioning Knative Serving CRDs and Control Plane..."
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.11.0/serving-crds.yaml
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.11.0/serving-core.yaml

echo "[NETWORK] Injecting Kourier eBPF-Compatible Ingress Controller..."
kubectl apply -f https://github.com/knative/net-kourier/releases/download/knative-v1.11.0/kourier.yaml

echo "[ROUTING] Binding Kourier to the Default Knative Network..."
kubectl patch configmap/config-network \
  --namespace knative-serving \
  --type merge \
  --patch '{"data":{"ingress-class":"kourier.ingress.networking.knative.dev"}}'

echo "[WAIT] Aligning Autoscaler and Activator Pods (30s)..."
sleep 15
kubectl wait --for=condition=ready pod -l app=autoscaler -n knative-serving --timeout=120s
kubectl wait --for=condition=ready pod -l app=activator -n knative-serving --timeout=120s

echo "[DEPLOY] Provisioning Zero-VRAM Serverless Inference Engine..."
kubectl apply -f 1-serverless-ai-engine.yaml

echo "Serverless Matrix is ARMED. Knative Activator is intercepting edge traffic."
#!/bin/bash
echo "[INIT] Provisioning Contour Control Plane and Envoy Data Plane..."
kubectl apply -f https://projectcontour.io/quickstart/contour.yaml

echo "[WAIT] Aligning Envoy Proxy Edge Gateways (30s)..."
sleep 30
kubectl wait --for=condition=ready pod -l app=contour -n project-contour --timeout=120s
kubectl wait --for=condition=ready pod -l app=envoy -n project-contour --timeout=120s

echo "[DEPLOY] Provisioning High-Value AI Backend..."
kubectl apply -f 1-ai-backend.yaml

echo "[DEPLOY] Injecting Layer 7 HTTPProxy Routing and Rate Limit Algorithms..."
kubectl apply -f 2-httpproxy-gateway.yaml
sleep 5

echo "API Gateway Matrix is ARMED. Envoy proxy is actively intercepting edge traffic."
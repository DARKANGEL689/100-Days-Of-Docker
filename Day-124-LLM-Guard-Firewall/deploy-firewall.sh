#!/bin/bash
echo "Injecting Declarative Ingress Scan Policies..."
kubectl apply -f 1-guard-config.yaml

echo "Injecting AI Proxy Application Logic..."
kubectl apply -f 2-proxy-logic.yaml

echo "Deploying GenAI Edge Firewall Infrastructure..."
kubectl apply -f 3-proxy-deployment.yaml

echo "Waiting for defensive models to initialize inside the container..."
sleep 5
kubectl wait --for=condition=available deployment/ai-gateway-firewall --timeout=150s

echo "GenAI Firewall Layer is secure and operational."
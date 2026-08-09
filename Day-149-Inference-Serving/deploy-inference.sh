#!/bin/bash
echo "Injecting Inference API Logic to Control Plane..."
kubectl apply -f 1-inference-logic.yaml

echo "Deploying High-Performance Inference Server..."
kubectl apply -f 2-inference-deployment.yaml

echo "Arming Elastic Traffic Autoscaler (HPA)..."
kubectl apply -f 3-inference-hpa.yaml

echo "Waiting for Inference Engine to report ONLINE status..."
sleep 5
kubectl wait --for=condition=available deployment/transformer-inference-server --timeout=120s

echo "Inference Matrix is ARMED and ready for production traffic."
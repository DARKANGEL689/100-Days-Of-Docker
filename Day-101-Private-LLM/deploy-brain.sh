#!/bin/bash
echo "Deploying the Private Intelligence Core (vLLM)..."
kubectl apply -f 1-vllm-engine.yaml
kubectl apply -f 2-vllm-service.yaml

echo "Waiting for the engine to boot..."
echo "(Note: The first initialization will take several minutes as the pod downloads the neural network weights!)"
kubectl wait --for=condition=available deployment/enterprise-intelligence-core --timeout=600s

echo "The cluster is now conscious. vLLM Engine is ONLINE."
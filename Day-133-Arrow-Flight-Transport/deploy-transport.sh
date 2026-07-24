#!/bin/bash
echo "Injecting Columnar Engine Logic (Apache Arrow ConfigMaps)..."
kubectl apply -f 1-flight-logic.yaml

echo "Deploying Apache Arrow Flight Memory Server..."
kubectl apply -f 2-flight-deployment.yaml

echo "Waiting for data blocks to synthesize inside cluster RAM..."
sleep 5
kubectl wait --for=condition=available deployment/arrow-flight-server --timeout=120s

echo "Arrow Flight Transport Core is active and listening."
#!/bin/bash
echo "Deploying Distributed Trace Backend (Jaeger)..."
kubectl apply -f 1-jaeger-backend.yaml

echo "Deploying OpenTelemetry Collector Router..."
kubectl apply -f 2-otel-collector.yaml

echo "Deploying Auto-Instrumented Microservice Chain..."
kubectl apply -f 3-microservice-chain.yaml

echo "Waiting for the Observability Mesh to initialize..."
sleep 5
kubectl wait --for=condition=available deployment/order-api --timeout=120s
kubectl wait --for=condition=available deployment/inventory-api --timeout=120s

echo "Observability Mesh is ONLINE. Traces are actively flowing."
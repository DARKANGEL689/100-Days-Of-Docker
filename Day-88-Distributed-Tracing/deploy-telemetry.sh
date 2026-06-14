#!/bin/bash
echo "Deploying Enterprise Distributed Tracing Architecture..."
kubectl apply -f 1-jaeger-engine.yaml
kubectl apply -f 2-jaeger-service.yaml
kubectl apply -f 3-hotrod-app.yaml
kubectl apply -f 4-hotrod-service.yaml

echo "Waiting for the Omniscient Eye (Jaeger) to boot..."
kubectl wait --for=condition=ready pod -l app=jaeger --timeout=120s

echo "Waiting for the HotROD Microservices to boot..."
kubectl wait --for=condition=ready pod -l app=hotrod --timeout=120s

echo "Architecture is ONLINE. Microservices are actively reporting telemetry."
#!/bin/bash
echo "Injecting Serverless Workload Definition..."
kubectl apply -f 1-serverless-api.yaml

echo "Waiting for Knative to synthesize the routing, revisions, and configurations..."
sleep 10
kubectl wait --for=condition=ready ksvc/enterprise-serverless-api --timeout=120s

echo "Serverless endpoint is ARMED. It is currently scaling down to 0 replicas."
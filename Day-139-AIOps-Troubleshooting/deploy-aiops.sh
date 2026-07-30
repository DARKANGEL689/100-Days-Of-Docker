#!/bin/bash
echo "Executing Backend Authentication Sequence..."

echo "Injecting the Engineered Failure Payload..."
kubectl apply -f 2-failing-microservice.yaml

echo "Waiting for Kubernetes to trigger the ImagePullBackOff anomaly..."
sleep 5

echo "The cluster is actively failing. Human intervention is required."
#!/bin/bash
echo "Deploying choking legacy monolith and VPA Advisor..."
kubectl apply -f 1-legacy-monolith.yaml
kubectl apply -f 2-vpa-advisor.yaml

echo "Waiting for monolith to initialize..."
kubectl wait --for=condition=available deployment/legacy-monolith --timeout=60s
echo "Monolith online. It is currently starving for CPU."
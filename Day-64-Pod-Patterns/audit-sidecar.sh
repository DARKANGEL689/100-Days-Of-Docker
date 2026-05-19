#!/bin/bash
echo "Deploying Sidecar Architecture..."
kubectl apply -f sidecar-logger.yaml
kubectl wait --for=condition=ready pod sidecar-log-shipper --timeout=30s

echo "--------------------------------------------------------"
echo "Extracting telemetry directly from the Sidecar Agent..."
kubectl logs sidecar-log-shipper -c log-forwarder-agent --tail=3
echo "--------------------------------------------------------"
echo "Sidecar pattern successful: Logs decoupled and forwarded."
#!/bin/bash
echo "Auditing Event-Driven Autoscaling (KEDA) Matrix..."
echo "--------------------------------------------------------"
echo "Watching AI Consumer Pods scale in response to Kafka Topic Lag..."
echo "Press Ctrl+C to exit the watch window."
echo "--------------------------------------------------------"
kubectl get pods -l app=ai-consumer -w
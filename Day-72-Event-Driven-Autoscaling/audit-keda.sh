#!/bin/bash
echo "Auditing Event-Driven Autoscaling (KEDA)..."
echo "-------------------------------------------"
echo "Watch the queue-worker pods boot from nothing!"
kubectl get pods -l app=task-processor -w
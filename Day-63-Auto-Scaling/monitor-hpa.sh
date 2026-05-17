#!/bin/bash
echo "Monitoring Horizontal Pod Autoscaler Telemetry..."
echo "Watch the CPU % rise, and the REPLICAS count expand."
echo "---------------------------------------------------"
kubectl get hpa -w
#!/bin/bash
echo "Submitting the ML Factory Pipeline to the Kubernetes API..."
kubectl apply -f 1-ml-pipeline.yaml

echo "Tracking the Pipeline execution graph..."
WF_NAME=$(kubectl get workflow -n default --sort-by=.metadata.creationTimestamp | tail -n 1 | awk '{print $1}')

echo "Monitoring Pipeline: $WF_NAME"
kubectl get workflow $WF_NAME -w
#!/bin/bash
echo "Executing Live Architecture Upgrade..."
helm upgrade v1-alpha ./my-enterprise-app \
  --set replicaCount=5 \
  --set appSettings.uiTheme="light-mode"

echo "--------------------------------------------------------"
echo "Watch the cluster dynamically scale to 5 replicas:"
kubectl get pods -w
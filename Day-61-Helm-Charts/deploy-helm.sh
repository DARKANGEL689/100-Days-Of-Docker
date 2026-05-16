#!/bin/bash
echo "Packaging and Deploying Helm Chart (Release: v1-alpha)..."
helm install v1-alpha ./my-enterprise-app

echo "--------------------------------------------------------"
echo "Validating dynamic template generation:"
kubectl get pods,svc,configmap
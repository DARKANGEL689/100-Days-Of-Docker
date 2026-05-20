#!/bin/bash
echo "Executing Kustomize Build for DEV Environment..."
echo "------------------------------------------------"
kubectl kustomize overlays/dev

echo ""
echo "Executing Kustomize Build for PROD Environment..."
echo "------------------------------------------------"
kubectl kustomize overlays/prod
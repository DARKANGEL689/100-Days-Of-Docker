#!/bin/bash
echo "Auditing the Autonomous Software Factory Output..."
echo "--------------------------------------------------------"

POD_NAME=$(kubectl get pods -l job-name=autonomous-software-factory -o jsonpath='{.items[0].metadata.name}')

echo "=== PHASE 1: GENERATION LOGS (Init Container) ==="
kubectl logs $POD_NAME -c ai-builder
echo ""

echo "=== PHASE 2: GITOPS LOGS (Main Container) ==="
kubectl logs $POD_NAME -c gitops-publisher
echo "--------------------------------------------------------"
echo "If the logs above show app.py, Dockerfile, and deployment.yaml being committed to Git, the AI has successfully written an entire microservice from scratch!"
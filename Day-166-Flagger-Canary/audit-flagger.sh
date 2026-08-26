#!/bin/bash
echo "Auditing Autonomous Canary Analysis..."
echo "--------------------------------------------------------"
echo ">>> [1/2] Injecting V2 Update into the API Deployment..."
kubectl set image deployment/ml-inference-api api=stefanprodan/podinfo:6.0.1

echo ""
echo ">>> [2/2] Tailing Flagger Controller Orchestration..."
echo "Watch the 'Weight' column autonomously shift from 10 to 50, followed by a Promotion."
echo "Press Ctrl+C to exit the live watch."
echo "--------------------------------------------------------"

kubectl get canary ml-inference-api -w
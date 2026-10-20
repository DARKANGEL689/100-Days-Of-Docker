#!/bin/bash
echo "Auditing Autonomous Agentic Infrastructure Generation..."
echo "--------------------------------------------------------"

echo ">>> [1/2] EXTRACTING AGENT CONSCIOUSNESS (Live Logs):"
AGENT_POD=$(kubectl get pods -l app=ai-orchestrator -o jsonpath='{.items[0].metadata.name}')
kubectl logs $AGENT_POD
echo ""

echo ">>> [2/2] VERIFYING AUTONOMOUS INFRASTRUCTURE:"
echo "Interrogating API Server for 'matrix-web-core' deployment..."
sleep 2
kubectl get deployment matrix-web-core
echo ""
echo "Interrogating resulting physical pods..."
kubectl get pods -l app=matrix-web-core

echo "--------------------------------------------------------"
echo "Congratulations, Ahad. You just watched an AI authenticate itself, analyze its environment, make a decision, and physically alter the datacenter."
echo "The 200-day journey is complete."
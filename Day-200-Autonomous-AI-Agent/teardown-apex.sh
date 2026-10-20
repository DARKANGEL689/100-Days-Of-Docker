#!/bin/bash
echo "Executing clean teardown of Day 200 Architecture..."
kubectl delete deployment matrix-web-core --ignore-not-found
kubectl delete -f 3-agent-deployment.yaml --ignore-not-found
kubectl delete -f 2-agent-brain.yaml --ignore-not-found
kubectl delete -f 1-agent-rbac.yaml --ignore-not-found
echo "Teardown complete. Agentic access revoked."
#!/bin/bash
echo "Executing clean teardown of Day 102 Architecture..."
kubectl delete -f 3-agent-job.yaml --ignore-not-found
kubectl delete -f 2-agent-logic.yaml --ignore-not-found
kubectl delete -f 1-agent-rbac.yaml --ignore-not-found
echo "Teardown complete. Agentic capabilities suspended."
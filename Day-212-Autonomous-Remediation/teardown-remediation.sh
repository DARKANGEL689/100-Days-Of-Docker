#!/bin/bash
echo "Executing clean teardown of Day 212 Architecture..."
kubectl delete -f 3-sre-deployment.yaml --ignore-not-found
kubectl delete -f 2-ai-sre-logic.yaml --ignore-not-found
kubectl delete -f 1-ai-sre-rbac.yaml --ignore-not-found
echo "Teardown complete. Automated remediation detached."
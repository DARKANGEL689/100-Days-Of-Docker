#!/bin/bash
echo "Executing clean teardown of Day 187 Architecture..."
kubectl delete pod compliant-enterprise-pod --ignore-not-found
kubectl delete pod rogue-unbounded-pod --ignore-not-found
kubectl delete -f 2-enforce-limits.yaml --ignore-not-found
kubectl delete -f 1-constraint-template.yaml --ignore-not-found
helm uninstall gatekeeper -n gatekeeper-system
kubectl delete namespace gatekeeper-system --ignore-not-found
echo "Teardown complete. Admission webhooks detached."
#!/bin/bash
echo "Executing clean teardown of Day 160 Architecture..."
kubectl delete -f 2-unsecured-ai-pod.yaml --ignore-not-found
kubectl delete -f 1-mutating-policy.yaml --ignore-not-found
helm uninstall kyverno -n kyverno
kubectl delete namespace kyverno --ignore-not-found
echo "Teardown complete. Admission webhooks unregistered."
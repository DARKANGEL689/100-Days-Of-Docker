#!/bin/bash
export KSERVE_VERSION="v0.11.2"
echo "Executing clean teardown of Day 180 Architecture..."
kubectl delete -f 1-inference-service.yaml --ignore-not-found
kubectl delete -f https://github.com/kserve/kserve/releases/download/${KSERVE_VERSION}/kserve.yaml --ignore-not-found
helm uninstall cert-manager -n cert-manager
kubectl delete namespace cert-manager --ignore-not-found
kubectl delete namespace kserve --ignore-not-found
echo "Teardown complete. Model servers flushed from memory."
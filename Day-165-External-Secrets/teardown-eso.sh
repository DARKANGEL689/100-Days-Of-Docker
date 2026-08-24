#!/bin/bash
echo "Executing clean teardown of Day 165 Architecture..."
kubectl delete -f 3-consuming-pod.yaml --ignore-not-found
kubectl delete -f 2-external-secret.yaml --ignore-not-found
kubectl delete -f 1-eso-secret-store.yaml --ignore-not-found
helm uninstall external-secrets -n external-secrets
kubectl delete namespace external-secrets --ignore-not-found
echo "Teardown complete. In-memory cryptographic materials flushed."
#!/bin/bash
echo "Executing clean teardown of Day 186 Architecture..."
kubectl delete -f 3-secure-workload.yaml --ignore-not-found
kubectl delete -f 2-external-secret.yaml --ignore-not-found
kubectl delete -f 1-secret-store.yaml --ignore-not-found
helm uninstall external-secrets -n external-secrets
kubectl delete namespace external-secrets --ignore-not-found
echo "Teardown complete. Vault synchronizations severed and native secrets wiped."
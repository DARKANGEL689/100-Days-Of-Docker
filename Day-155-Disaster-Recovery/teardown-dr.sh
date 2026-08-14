#!/bin/bash
echo "Executing clean teardown of Day 155 Architecture..."
kubectl delete -f 3-dr-triggers.yaml --ignore-not-found
kubectl delete -f 2-target-database.yaml --ignore-not-found
kubectl delete -f 1-minio-vault.yaml --ignore-not-found
helm uninstall velero -n velero
kubectl delete namespace velero --ignore-not-found
rm velero-values.yaml
echo "Teardown complete. Backup vaults flushed."
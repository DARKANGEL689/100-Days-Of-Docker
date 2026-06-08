#!/bin/bash
echo "Executing clean teardown of Day 82 Architecture..."
kubectl delete -f 3-secure-app.yaml --ignore-not-found
kubectl delete -f 2-app-rbac.yaml --ignore-not-found
kubectl delete -f 1-postgres-db.yaml --ignore-not-found
echo "Teardown complete. Vault Engine remains active."
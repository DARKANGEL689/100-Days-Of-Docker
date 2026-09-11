#!/bin/bash
echo "Executing clean teardown of Day 179 Architecture..."
kubectl delete -f 1-postgres-cluster.yaml --ignore-not-found


kubectl delete pvc -l cnpg.io/cluster=ml-database-matrix --ignore-not-found

helm uninstall cnpg -n cnpg-system
kubectl delete namespace cnpg-system --ignore-not-found
echo "Teardown complete. Stateful storage dropped."
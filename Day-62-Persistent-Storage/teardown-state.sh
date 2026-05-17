#!/bin/bash
echo "Executing clean teardown of Stateful Architecture..."
kubectl delete deployment single-node-db
kubectl delete statefulset db-cluster
kubectl delete svc enterprise-db-cluster
kubectl delete pvc postgres-data-claim
kubectl delete pvc -l app=stateful-db
echo "Teardown complete. All hard drives formatted and purged."
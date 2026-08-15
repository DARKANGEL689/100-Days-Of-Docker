#!/bin/bash
echo "Executing clean teardown of Day 156 Architecture..."
kubectl delete workflows --all -n default
kubectl delete -f 1-argo-rbac.yaml --ignore-not-found
helm uninstall argo-workflows -n argo
kubectl delete namespace argo --ignore-not-found
echo "Teardown complete. DAG sequences flushed."
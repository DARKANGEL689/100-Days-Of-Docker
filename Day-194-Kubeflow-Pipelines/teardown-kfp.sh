#!/bin/bash
echo "Executing clean teardown of Day 194 Architecture..."
kubectl delete workflows --all -n default
helm uninstall argo-workflows -n argo
kubectl delete namespace argo --ignore-not-found
echo "Teardown complete. DAG controllers detached."
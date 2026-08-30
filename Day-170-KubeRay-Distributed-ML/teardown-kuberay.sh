#!/bin/bash
echo "Executing clean teardown of Day 170 Architecture..."
kubectl delete -f 2-distributed-job.yaml --ignore-not-found
kubectl delete -f 1-ray-cluster.yaml --ignore-not-found
helm uninstall kuberay-operator -n kuberay-system
kubectl delete namespace kuberay-system --ignore-not-found
echo "Teardown complete. Supercluster flushed from memory."
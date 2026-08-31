#!/bin/bash
echo "Executing clean teardown of Day 171 Architecture..."
kubectl delete -f 3-mtls-strict-policy.yaml --ignore-not-found
kubectl delete -f 2-rogue-legacy-pod.yaml --ignore-not-found
kubectl delete -f 1-secure-workloads.yaml --ignore-not-found
kubectl label namespace default istio-injection-
helm uninstall istiod -n istio-system
helm uninstall istio-base -n istio-system
kubectl delete namespace istio-system --ignore-not-found
kubectl delete namespace legacy-system --ignore-not-found
echo "Teardown complete. Service mesh collapsed."
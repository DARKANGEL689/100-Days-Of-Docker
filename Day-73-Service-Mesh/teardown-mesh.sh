#!/bin/bash
echo "Executing clean teardown of Service Mesh Configurations..."
kubectl delete -f fault-injection.yaml --ignore-not-found
kubectl delete -f circuit-breaker.yaml --ignore-not-found
kubectl delete -f strict-mtls.yaml --ignore-not-found
kubectl delete -f mesh-workloads.yaml --ignore-not-found
echo "Teardown complete. Istio Control Plane remains active."
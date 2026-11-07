#!/bin/bash
echo "Executing clean teardown of Day 208 Architecture..."
kubectl delete -f 2-chaos-experiments.yaml --ignore-not-found
kubectl delete -f 1-target-matrix.yaml --ignore-not-found
helm uninstall chaos-mesh -n chaos-testing
kubectl delete namespace chaos-testing --ignore-not-found
echo "Teardown complete. Chaos daemons detached. Stable state restored."
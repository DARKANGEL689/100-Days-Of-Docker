#!/bin/bash
echo "Executing clean teardown of Day 162 Architecture..."
kubectl delete -f 2-pod-kill-chaos.yaml --ignore-not-found
echo "Ceasefire initiated. Allowing API to stabilize..."
sleep 5

kubectl delete -f 1-target-api.yaml --ignore-not-found
helm uninstall chaos-mesh -n chaos-testing
kubectl delete namespace chaos-testing --ignore-not-found
echo "Teardown complete. Chaos Daemons uninstalled."
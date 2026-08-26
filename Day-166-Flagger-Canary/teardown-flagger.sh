#!/bin/bash
echo "Executing clean teardown of Day 166 Architecture..."
kubectl delete -f 2-flagger-canary.yaml --ignore-not-found
kubectl delete -f 1-inference-api.yaml --ignore-not-found
helm uninstall flagger -n flagger-system
kubectl delete namespace flagger-system --ignore-not-found
echo "Teardown complete. Canary routing meshes flushed."
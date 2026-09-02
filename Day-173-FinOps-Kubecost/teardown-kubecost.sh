#!/bin/bash
echo "Executing clean teardown of Day 173 Architecture..."
kubectl delete -f 1-expensive-ml-workload.yaml --ignore-not-found
helm uninstall kubecost -n kubecost
kubectl delete namespace kubecost --ignore-not-found
echo "Teardown complete. Financial telemetry dropped."
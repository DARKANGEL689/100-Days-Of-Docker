#!/bin/bash
echo "Executing clean teardown of Day 124 Architecture..."
kubectl delete -f 3-proxy-deployment.yaml --ignore-not-found
kubectl delete -f 2-proxy-logic.yaml --ignore-not-found
kubectl delete -f 1-guard-config.yaml --ignore-not-found
echo "Teardown complete. Security boundaries recycled."
#!/bin/bash
echo "Executing clean teardown of Day 92 Architecture..."
kubectl delete -f 2-deploy-engine.yaml --ignore-not-found
kubectl delete -f 1-antigravity-crd.yaml --ignore-not-found
rm -rf operator-env
echo "Teardown complete. API extensions removed."
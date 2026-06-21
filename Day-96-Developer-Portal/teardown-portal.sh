#!/bin/bash
echo "Executing clean teardown of Day 96 Architecture..."
kubectl delete -f 3-golden-path-template.yaml --ignore-not-found
kubectl delete -f 2-catalog-component.yaml --ignore-not-found
kubectl delete -f 1-system-architecture.yaml --ignore-not-found
echo "Teardown complete. Backstage Engine remains active."
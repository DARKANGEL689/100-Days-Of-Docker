#!/bin/bash
echo "Executing clean teardown of Day 133 Architecture..."
kubectl delete -f 2-flight-deployment.yaml --ignore-not-found
kubectl delete -f 1-flight-logic.yaml --ignore-not-found
echo "Teardown complete. Columnar networks recycled."
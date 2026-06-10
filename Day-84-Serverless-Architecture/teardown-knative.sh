#!/bin/bash
echo "Executing clean teardown of Day 84 Architecture..."
kubectl delete -f 1-serverless-api.yaml --ignore-not-found
echo "Teardown complete. Knative Engine remains active."
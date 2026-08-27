#!/bin/bash
echo "Executing clean teardown of Day 167 Architecture..."
kubectl delete -f 1-serverless-inference.yaml --ignore-not-found
kubectl delete -f https://github.com/knative/serving/releases/download/v1.11.0/serving-default-domain.yaml --ignore-not-found
kubectl delete -f https://github.com/knative/net-kourier/releases/download/v1.11.0/kourier.yaml --ignore-not-found
kubectl delete -f https://github.com/knative/serving/releases/download/v1.11.0/serving-core.yaml --ignore-not-found
kubectl delete -f https://github.com/knative/serving/releases/download/v1.11.0/serving-crds.yaml --ignore-not-found
echo "Teardown complete. Serverless controllers flushed."
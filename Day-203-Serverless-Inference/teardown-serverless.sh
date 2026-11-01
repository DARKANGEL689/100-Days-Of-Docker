#!/bin/bash
echo "Executing clean teardown of Day 203 Architecture..."
kubectl delete -f 1-serverless-ai-engine.yaml --ignore-not-found
kubectl delete -f https://github.com/knative/net-kourier/releases/download/knative-v1.11.0/kourier.yaml --ignore-not-found
kubectl delete -f https://github.com/knative/serving/releases/download/knative-v1.11.0/serving-core.yaml --ignore-not-found
kubectl delete -f https://github.com/knative/serving/releases/download/knative-v1.11.0/serving-crds.yaml --ignore-not-found
echo "Teardown complete. Autoscaling proxies detached."
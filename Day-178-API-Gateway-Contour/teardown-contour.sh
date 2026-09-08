#!/bin/bash
echo "Executing clean teardown of Day 178 Architecture..."
kubectl delete -f 2-httpproxy-gateway.yaml --ignore-not-found
kubectl delete -f 1-ai-backend.yaml --ignore-not-found
kubectl delete -f https://projectcontour.io/quickstart/contour.yaml --ignore-not-found
echo "Teardown complete. Envoy edge proxies collapsed."
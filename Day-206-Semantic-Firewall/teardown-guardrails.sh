#!/bin/bash
echo "Executing clean teardown of Day 206 Architecture..."
kubectl delete -f 2-semantic-proxy.yaml --ignore-not-found
kubectl delete -f 1-guardrail-logic.yaml --ignore-not-found
echo "Teardown complete. Semantic firewalls collapsed."
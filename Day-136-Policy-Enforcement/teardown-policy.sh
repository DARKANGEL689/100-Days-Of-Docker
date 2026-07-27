#!/bin/bash
echo "Executing clean teardown of Day 136 Architecture..."
kubectl delete -f 2-constraint.yaml --ignore-not-found
kubectl delete -f 1-constraint-template.yaml --ignore-not-found
kubectl delete -f 3-rogue-payload.yaml --ignore-not-found
echo "Teardown complete. Admission webhooks cleared."
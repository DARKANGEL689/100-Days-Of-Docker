#!/bin/bash
echo "Executing clean teardown of Day 91 Architecture..."
kubectl delete -f 3-vpa-autonomous.yaml --ignore-not-found
kubectl delete -f 1-legacy-monolith.yaml --ignore-not-found
rm -rf autoscaler
echo "Teardown complete."
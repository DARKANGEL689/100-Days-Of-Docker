#!/bin/bash
echo "Executing clean teardown of Day 128 Architecture..."
kubectl delete -f 2-ai-inferencing.yaml --ignore-not-found
echo "Teardown complete. Pods terminated. Hardware slices released."

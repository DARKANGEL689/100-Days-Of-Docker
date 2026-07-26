#!/bin/bash
echo "Executing clean teardown of Day 135 Architecture..."
kubectl delete -f 2-traffic-split.yaml --ignore-not-found
kubectl delete -f 1-meshed-backends.yaml --ignore-not-found
echo "Teardown complete. Traffic limits flushed. Sidecars terminated."
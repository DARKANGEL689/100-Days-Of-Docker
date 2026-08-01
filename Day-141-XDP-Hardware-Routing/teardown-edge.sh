#!/bin/bash
echo "Executing clean teardown of Day 141 Architecture..."
kubectl delete -f 2-xdp-lb.yaml --ignore-not-found
kubectl delete -f 1-high-frequency-api.yaml --ignore-not-found
echo "Teardown complete. XDP maps flushed."
#!/bin/bash
echo "Executing clean teardown of Day 151 Architecture..."
kubectl delete -f 2-async-workers.yaml --ignore-not-found
kubectl delete -f 1-kafka-broker.yaml --ignore-not-found
echo "Teardown complete. Event streams flushed."
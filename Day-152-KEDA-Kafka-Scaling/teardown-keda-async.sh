#!/bin/bash
echo "Executing clean teardown of Day 152 Architecture..."
kubectl delete -f 3-keda-scaler.yaml --ignore-not-found
kubectl delete -f 2-inference-workers.yaml --ignore-not-found
kubectl delete -f 1-kafka-broker.yaml --ignore-not-found
echo "Teardown complete. Event streams flushed. Scaling algorithms deactivated."
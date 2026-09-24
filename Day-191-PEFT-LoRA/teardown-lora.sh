#!/bin/bash
echo "Executing clean teardown of Day 191 Architecture..."
kubectl delete -f 2-lora-training-job.yaml --ignore-not-found
kubectl delete -f 1-lora-training-script.yaml --ignore-not-found
echo "Teardown complete. Computational matrices flushed."
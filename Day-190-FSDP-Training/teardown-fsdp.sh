#!/bin/bash
echo "Executing clean teardown of Day 190 Architecture..."
kubectl delete -f 2-pytorch-distributed-job.yaml --ignore-not-found
kubectl delete -f 1-fsdp-training-script.yaml --ignore-not-found
kubectl delete -k "github.com/kubeflow/training-operator/manifests/overlays/standalone?ref=v1.7.0" --ignore-not-found
echo "Teardown complete. Distributed training ring collapsed."
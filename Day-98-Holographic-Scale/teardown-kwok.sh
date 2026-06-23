#!/bin/bash
echo "Executing clean teardown of Day 98 Architecture..."
kubectl delete -f 2-hyper-scale-deployment.yaml --ignore-not-found

echo "Desynthesizing Holographic Nodes..."
kubectl delete nodes -l type=kwok

echo "Teardown complete. Reality restored."
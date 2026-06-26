#!/bin/bash
echo "Executing clean teardown of Day 101 Architecture..."
kubectl delete -f 2-vllm-service.yaml --ignore-not-found
kubectl delete -f 1-vllm-engine.yaml --ignore-not-found
echo "Teardown complete. Synaptic pathways severed."
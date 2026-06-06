#!/bin/bash
echo "Executing clean teardown of Day 80 Architecture..."
kubectl delete -f 1-vulnerable-api.yaml --ignore-not-found
echo "Teardown complete. Falco eBPF Engine remains active in the kernel."
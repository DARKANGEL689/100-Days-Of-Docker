#!/bin/bash
echo "Extracting the live YAML from the currently running pod..."
POD_NAME=$(kubectl get pod -l app=monolith -o jsonpath='{.items[0].metadata.name}')

echo "Pod Name: $POD_NAME"
echo "--------------------------------------------------------"
kubectl get pod $POD_NAME -o yaml | grep -A 4 "requests:"
echo "--------------------------------------------------------"
echo "Compare the CPU request above to your original 1-legacy-monolith.yaml (which was 10m)."
echo "If the number is higher, the VPA Admission Webhook successfully intercepted the pod creation and injected physical hardware upgrades!"
#!/bin/bash
echo "Auditing Universal API Integration..."
echo "--------------------------------------------------------"

echo "Querying Kubernetes for your custom object:"
kubectl get antigravityengines.protocol.com
echo ""

echo "Querying Kubernetes for the physical pods synthesized by Python:"
kubectl get pods -l app=mark-iv-prototype
echo "--------------------------------------------------------"
echo "If you see 3 physical thruster pods running, your Operator successfully manipulated the cluster!"
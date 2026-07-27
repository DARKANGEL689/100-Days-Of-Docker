#!/bin/bash
echo "Injecting Rego Logic Definitions (ConstraintTemplate)..."
kubectl apply -f 1-constraint-template.yaml

echo "Waiting for Gatekeeper to compile the Rego template into the cluster memory..."
sleep 5

echo "Applying Architectural Constraints against all Pods..."
kubectl apply -f 2-constraint.yaml

echo "Waiting for the constraint to propagate across admission webhooks..."
sleep 5

echo "Policy Engine is ARMED. No developer can bypass these boundaries."
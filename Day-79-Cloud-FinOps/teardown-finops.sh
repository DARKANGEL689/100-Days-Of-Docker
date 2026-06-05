#!/bin/bash
echo "Executing clean teardown of FinOps Architecture..."
kubectl delete -f 3-financial-guardrail.yaml --ignore-not-found
kubectl delete -f 2-optimized-billing-app.yaml --ignore-not-found
kubectl delete -f 1-rogue-billing-app.yaml --ignore-not-found
echo "Teardown complete. Kubecost engine remains active."
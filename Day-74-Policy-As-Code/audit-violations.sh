#!/bin/bash
echo "Auditing Cluster for Active Policy Violations..."
echo "----------------------------------------------"
kubectl get k8sblocklatesttag block-latest-tags -o jsonpath='{.status.violations}' | jq . || echo "No pre-existing violations found in the cluster payload."
echo "----------------------------------------------"
#!/bin/bash
echo "Executing clean teardown of Day 58 RBAC Architecture..."
kubectl delete pod authorized-agent rogue-agent
kubectl delete rolebinding read-pods-binding
kubectl delete role pod-reader
kubectl delete clusterrolebinding global-node-binding
kubectl delete clusterrole global-node-auditor
kubectl delete serviceaccount api-explorer
echo "Teardown complete. Identities revoked."
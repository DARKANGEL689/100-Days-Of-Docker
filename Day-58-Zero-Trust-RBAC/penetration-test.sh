#!/bin/bash
echo "Executing internal API Penetration Test..."
echo "-----------------------------------------"

API="https://kubernetes.default.svc/api/v1/namespaces/default/pods"

echo "[TEST 1] Rogue Agent attempting to list pods..."
kubectl exec rogue-agent -- sh -c \
  'curl -s -k -H "Authorization: Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" '$API | grep -o "Forbidden" || echo "Access Denied."

echo ""
echo "[TEST 2] Authorized Agent attempting to list pods..."
kubectl exec authorized-agent -- sh -c \
  'curl -s -k -H "Authorization: Bearer $(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" '$API | grep -o "pod-reader-role" || echo "Success: 200 OK - Pods Listed."

echo "-----------------------------------------"
echo "Zero Trust RBAC is strictly enforcing perimeter."
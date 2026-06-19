#!/bin/bash
echo "[DEVELOPER VIEW] Executing Business Logic: Saving a shopping cart."
POD_NAME=$(kubectl get pod -l app=business-logic -o jsonpath='{.items[0].metadata.name}')

echo "Sending generic HTTP POST payload to the local Dapr Sidecar..."
kubectl exec $POD_NAME -c app -- curl -s -X POST http://localhost:3500/v1.0/state/enterprise-state-store \
  -H "Content-Type: application/json" \
  -d '[{"key": "order-123", "value": {"item": "Tesla Model S", "price": 80000}}]'

echo ""
echo "Data submitted successfully. No database connection strings or SDKs were used by the application."
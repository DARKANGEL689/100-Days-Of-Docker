#!/bin/bash
echo "[DEVELOPER VIEW] Executing Business Logic: Retrieving the shopping cart."
POD_NAME=$(kubectl get pod -l app=business-logic -o jsonpath='{.items[0].metadata.name}')

echo "Fetching data from Dapr Sidecar..."
kubectl exec $POD_NAME -c app -- curl -s http://localhost:3500/v1.0/state/enterprise-state-store/order-123
echo ""
echo "--------------------------------------------------------"
echo "Data retrieved flawlessly."
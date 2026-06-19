#!/bin/bash
echo "[ARCHITECT VIEW] Auditing the physical Redis Database..."
echo "--------------------------------------------------------"
REDIS_POD=$(kubectl get pod -l app=redis -o jsonpath='{.items[0].metadata.name}')

echo "Querying underlying Redis keys:"
kubectl exec $REDIS_POD -- redis-cli keys '*'

echo ""
echo "Extracting the raw physical data block for our order:"
kubectl exec $REDIS_POD -- redis-cli hgetall "business-app||order-123"
echo "--------------------------------------------------------"
echo "Dapr intercepted the HTTP request, formatted it, encrypted it, and stored it natively in Redis."
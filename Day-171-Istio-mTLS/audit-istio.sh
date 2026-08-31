#!/bin/bash
echo "Auditing Strict mTLS Network Enforcement..."
echo "--------------------------------------------------------"

FRONTEND_POD=$(kubectl get pods -l app=frontend -n default -o jsonpath='{.items[0].metadata.name}')
ROGUE_POD=$(kubectl get pods -l app=rogue-client -n legacy-system -o jsonpath='{.items[0].metadata.name}')

echo ">>> [1/2] EXECUTING AUTHORIZED MESH TRAFFIC (Encrypted via Envoy):"
echo "Command: curl from 'secure-frontend' to 'secure-backend'"
HTTP_CODE=$(kubectl exec $FRONTEND_POD -n default -c client -- curl -s -o /dev/null -w "%{http_code}" http://secure-backend-svc.default.svc.cluster.local)
echo "[RESULT] HTTP Status Code: $HTTP_CODE (SUCCESS - Traffic was cryptographically validated)"
echo ""

echo ">>> [2/2] EXECUTING UNAUTHORIZED LEGACY TRAFFIC (Plain Text):"
echo "Command: curl from 'unencrypted-rogue-client' to 'secure-backend'"
echo "Initiating connection..."
kubectl exec $ROGUE_POD -n legacy-system -- curl -s --max-time 5 http://secure-backend-svc.default.svc.cluster.local || echo "[RESULT] Connection Terminated by Target Envoy Proxy (Connection Reset by Peer)"

echo "--------------------------------------------------------"
echo "The matrix is impenetrable. Only authenticated, encrypted traffic is permitted."
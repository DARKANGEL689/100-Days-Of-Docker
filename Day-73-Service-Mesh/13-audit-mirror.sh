#!/bin/bash
echo "Auditing Dark Traffic Mirroring..."
echo "-----------------------------------------"

kubectl apply -f 11-shadow-backend.yaml
kubectl apply -f 12-traffic-mirror.yaml
kubectl wait --for=condition=ready pod -l app=shadow-api --timeout=30s
echo ""

FRONTEND_POD=$(kubectl get pod -l app=frontend -o jsonpath='{.items[0].metadata.name}')
SHADOW_POD=$(kubectl get pod -l app=shadow-api -o jsonpath='{.items[0].metadata.name}')

echo "[USER VIEW] Firing request to Production Backend:"
kubectl exec $FRONTEND_POD -c client -- curl -s http://backend-svc
echo ""

echo "Wait 2 seconds for mesh telemetry to flush..."
sleep 2

echo "[ENGINEER VIEW] Extracting internal network logs from the Shadow Backend:"
echo "If you see a 'GET' request below, Istio successfully cloned the network packet!"
kubectl logs $SHADOW_POD -c api --tail=1
echo "-----------------------------------------"
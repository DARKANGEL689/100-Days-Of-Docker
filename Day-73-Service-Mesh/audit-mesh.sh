#!/bin/bash
echo "Auditing Istio Service Mesh Resiliency..."
echo "-----------------------------------------"

FRONTEND_POD=$(kubectl get pod -l app=frontend -o jsonpath='{.items[0].metadata.name}')

echo "Executing rapid asynchronous requests to trigger the Circuit Breaker..."
echo "Because 50% of requests are delayed by 5 seconds (Fault Injection), the queue will instantly fill up."
echo ""

for i in {1..10}; do
  kubectl exec $FRONTEND_POD -c client -- curl -s -o /dev/null -w "Request $i: HTTP %{http_code}\n" http://backend-svc &
done
wait

echo "-----------------------------------------"
echo "If you see HTTP 503s, the Circuit Breaker successfully saved the backend from cascading failure!"
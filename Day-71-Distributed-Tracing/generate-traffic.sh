#!/bin/bash
echo "Establishing temporary route to Microservice Frontend..."
kubectl port-forward svc/hotrod-frontend 8080:8080 &
PORT_PID=$!

echo "Waiting for tunnel to stabilize..."
sleep 3

echo "Executing 20 asynchronous customer transactions..."
echo "--------------------------------------------------"
for i in {1..20}; do
  curl -s "http://localhost:8080/dispatch?customer=392" > /dev/null
  echo "Transaction $i dispatched. Trace injected into Jaeger."
  sleep 0.5
done
echo "--------------------------------------------------"

echo "Traffic simulation complete. Closing tunnel."
kill $PORT_PID
#!/bin/bash
echo "Establishing tunnel to the HotROD Microservices..."
kubectl port-forward svc/hotrod-svc 8080:80 &
TUNNEL_PID=$!
sleep 3

echo "--------------------------------------------------------"
echo "Simulating user traffic: Requesting 5 complex ride calculations..."
for i in {1..5}; do
  curl -s "http://localhost:8080/dispatch?customer=392&nonse=0.5$i" > /dev/null
  echo "Ride request $i processed. Trace ID generated and sent to Jaeger."
  sleep 1
done
echo "--------------------------------------------------------"

kill $TUNNEL_PID
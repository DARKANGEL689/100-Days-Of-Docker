#!/bin/bash
echo "Deploying Ambassador Proxy Architecture..."
kubectl apply -f ambassador-proxy.yaml
kubectl wait --for=condition=ready pod network-ambassador --timeout=30s

echo "--------------------------------------------------------"
echo "Executing network request from Legacy App to localhost:8080..."
kubectl exec network-ambassador -c legacy-app -- curl -s -I http://localhost:8080 | grep "HTTP/1.1 200 OK" && echo "SUCCESS: Traffic intercepted and routed externally by Ambassador."
echo "--------------------------------------------------------"
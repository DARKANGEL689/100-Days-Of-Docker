#!/bin/bash
echo "Establishing tunnel to the Serverless Kourier Gateway..."
kubectl port-forward -n kourier-system svc/kourier 8080:80 &
TUNNEL_PID=$!
sleep 3

echo "--------------------------------------------------------"
echo "Firing HTTP Request to a dormant API..."
echo "(If the pod is scaled to zero, Knative will hold this request, boot the pod, and then serve it!)"
curl -s -w "\nHTTP Response Time: %{time_total}s\n" -H "Host: zero-scale-api.default.example.com" http://localhost:8080
echo "--------------------------------------------------------"

kill $TUNNEL_PID
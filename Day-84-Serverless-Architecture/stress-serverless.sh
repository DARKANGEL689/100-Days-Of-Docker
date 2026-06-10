#!/bin/bash
echo "Establishing tunnel to the Serverless Kourier Gateway..."
kubectl port-forward -n kourier-system svc/kourier 8080:80 &
TUNNEL_PID=$!
sleep 3

echo "Executing 50 rapid asynchronous requests..."
for i in {1..50}; do
  curl -s -H "Host: zero-scale-api.default.example.com" http://localhost:8080 > /dev/null &
done

echo "Traffic burst complete. Check your 'watch-scale.sh' terminal to see the cluster spin up an army of pods!"
sleep 5
kill $TUNNEL_PID
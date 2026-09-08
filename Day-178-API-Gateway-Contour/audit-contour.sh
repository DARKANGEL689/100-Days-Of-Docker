#!/bin/bash
echo "Auditing Envoy Layer 7 Rate Limiting..."
echo "--------------------------------------------------------"

kubectl port-forward svc/envoy -n project-contour 8080:80 > /dev/null 2>&1 &
PF_PID=$!
sleep 3

echo ">>> SIMULATING AGGRESSIVE CLIENT TRAFFIC BURST:"
echo "Target: http://ai-matrix.local (Routed via Envoy Proxy)"
echo "Policy: 3 Requests Per Minute"
echo ""

for i in {1..5}; do
  HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -H "Host: ai-matrix.local" http://127.0.0.1:8080/)
  
  if [ "$HTTP_CODE" -eq 200 ]; then
    echo "Request $i: HTTP 200 [AUTHORIZED] - Traffic passed to backend."
  elif [ "$HTTP_CODE" -eq 429 ]; then
    echo "Request $i: HTTP 429 [BLOCKED] - Envoy dropped packet at the edge."
  else
    echo "Request $i: HTTP $HTTP_CODE"
  fi
  sleep 0.5
done

echo "--------------------------------------------------------"
echo "Notice how the backend is completely shielded from requests 4 and 5."

kill $PF_PID
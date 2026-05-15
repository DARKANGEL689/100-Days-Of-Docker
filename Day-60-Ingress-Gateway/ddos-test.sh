#!/bin/bash
echo "Initiating Volumetric DDoS Simulation (10 concurrent requests)..."
echo "--------------------------------------------------------------"

for i in {1..10}; do
  curl -s -o /dev/null -w "Request $i: HTTP %{http_code}\n" -k -H "Host: the300protocol.local" https://localhost/api &
done

wait

echo "--------------------------------------------------------------"
echo "If you see HTTP 503s, the Rate Limiter successfully dropped the attack."
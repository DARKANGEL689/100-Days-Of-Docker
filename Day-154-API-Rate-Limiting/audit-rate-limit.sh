#!/bin/bash
echo "Auditing Layer 7 Edge Rate Limiting..."
echo "--------------------------------------------------------"

kubectl port-forward svc/edge-firewall-svc 8080:80 > /dev/null 2>&1 &
PF_PID=$!
sleep 3

echo "[TEST] Firing localized DoS burst (10 rapid requests)..."
echo ""

for i in {1..10}; do
    HTTP_STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" http://127.0.0.1:8080/infer)
    
    if [ "$HTTP_STATUS" == "200" ]; then
        echo "Request $i: [HTTP 200] SUCCESS -> Traffic Permitted"
    elif [ "$HTTP_STATUS" == "429" ]; then
        echo "Request $i: [HTTP 429] TOO MANY REQUESTS -> Traffic Destroyed at Edge"
    else
        echo "Request $i: [HTTP $HTTP_STATUS] UNKNOWN STATE"
    fi
done

kill $PF_PID

echo ""
echo "--------------------------------------------------------"
echo "If you see HTTP 429s, the rate limiter successfully protected the backend from the traffic burst."
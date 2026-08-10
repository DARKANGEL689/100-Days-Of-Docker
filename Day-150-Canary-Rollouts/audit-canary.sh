#!/bin/bash
echo "Auditing Progressive Canary Traffic Split..."
echo "--------------------------------------------------------"

kubectl port-forward svc/edge-gateway-svc 8080:80 > /dev/null 2>&1 &
PF_PID=$!
sleep 3

echo "[TEST] Executing 10 rapid inference requests..."
echo ""

V1_COUNT=0
V2_COUNT=0

for i in {1..10}; do
    RESPONSE=$(curl -s -X POST http://127.0.0.1:8080/infer)
    EXECUTED_BY=$(echo $RESPONSE | grep -o '"executed_by":"[^"]*"' | cut -d'"' -f4)
    
    echo "Request $i: Handled by -> [$EXECUTED_BY]"
    
    if [ "$EXECUTED_BY" == "V1-Stable" ]; then
        ((V1_COUNT++))
    elif [ "$EXECUTED_BY" == "V2-Canary" ]; then
        ((V2_COUNT++))
    fi
done

kill $PF_PID

echo ""
echo "--------------------------------------------------------"
echo "Traffic Distribution Analysis:"
echo "Stable (V1) Total: $V1_COUNT / 10 (Target: 80%)"
echo "Canary (V2) Total: $V2_COUNT / 10 (Target: 20%)"
echo "--------------------------------------------------------"
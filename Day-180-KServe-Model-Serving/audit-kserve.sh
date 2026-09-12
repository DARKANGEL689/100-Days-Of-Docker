#!/bin/bash
echo "Auditing KServe High-Performance Inference..."
echo "--------------------------------------------------------"

echo ">>> [1/3] Generating Raw Input Tensor Payload:"
cat << 'EOF' > payload.json
{
  "instances": [
    [6.8, 2.8, 4.8, 1.4],
    [6.0, 3.4, 4.5, 1.6]
  ]
}
EOF
cat payload.json
echo ""

echo ">>> [2/3] Establishing local tunnel to Inference Predictor..."
kubectl port-forward svc/iris-classifier-predictor-default 8080:80 > /dev/null 2>&1 &
PF_PID=$!
sleep 3

echo ">>> [3/3] Firing Matrix Multiplication Request to MLServer:"
echo "POST /v1/models/iris-classifier:predict"
curl -s -X POST -H "Content-Type: application/json" -d @payload.json http://127.0.0.1:8080/v1/models/iris-classifier:predict | jq .

echo "--------------------------------------------------------"
echo "Notice that you never wrote a single line of Python API code. KServe handled the networking, serialization, and tensor extraction automatically."

kill $PF_PID
rm payload.json
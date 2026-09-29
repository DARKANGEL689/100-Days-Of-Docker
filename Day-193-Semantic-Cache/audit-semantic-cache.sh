#!/bin/bash
echo "Auditing Autonomous LLM Caching Mechanics..."
echo "--------------------------------------------------------"

kubectl port-forward svc/llm-gateway-svc 8000:8000 > /dev/null 2>&1 &
PF_PID=$!
sleep 3

cat << 'EOF' > prompt.json
{
  "prompt": "Write a Kubernetes deployment YAML for Nginx."
}
EOF

echo ">>> [REQUEST 1] Initializing First API Call (Cache Miss):"
echo "The gateway is forcing the GPU to generate the response..."
curl -s -X POST http://127.0.0.1:8000/v1/completions -H "Content-Type: application/json" -d @prompt.json | jq .
echo ""

echo ">>> [REQUEST 2] Initializing Duplicate API Call (Cache Hit):"
echo "The gateway mathematically hashes the prompt and intercepts the request..."
curl -s -X POST http://127.0.0.1:8000/v1/completions -H "Content-Type: application/json" -d @prompt.json | jq .

echo "--------------------------------------------------------"
echo "Notice the 'latency_ms' difference. The second request bypassed the massive AI models entirely. This is how you serve millions of users without bankrupting your cloud billing."

kill $PF_PID
rm prompt.json
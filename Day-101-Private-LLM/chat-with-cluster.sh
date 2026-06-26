#!/bin/bash
echo "Establishing secure telemetry tunnel to the Intelligence Core..."
kubectl port-forward svc/vllm-api-svc 8000:80 > /dev/null 2>&1 &
TUNNEL_PID=$!
sleep 4

echo "--------------------------------------------------------"
echo "Sending Prompt: 'Explain the concept of Zero-Trust Security in one sentence.'"
echo "--------------------------------------------------------"

curl -s -X POST http://localhost:8000/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
    "model": "Qwen/Qwen2.5-1.5B-Instruct",
    "messages": [
      {"role": "system", "content": "You are a Senior Enterprise Architect. Be concise."},
      {"role": "user", "content": "Explain the concept of Zero-Trust Security in one sentence."}
    ],
    "max_tokens": 100,
    "temperature": 0.3
  }' | grep -o '"content": "[^"]*"' | sed 's/"content": "//' | sed 's/"$//'

echo ""
echo "--------------------------------------------------------"
kill $TUNNEL_PID
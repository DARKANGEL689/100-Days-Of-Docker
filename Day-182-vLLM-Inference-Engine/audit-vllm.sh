#!/bin/bash
echo "Auditing PagedAttention High-Throughput Inference..."
echo "--------------------------------------------------------"

kubectl port-forward svc/vllm-api-svc 8000:8000 > /dev/null 2>&1 &
PF_PID=$!
sleep 3

echo ">>> [1/2] Formatting OpenAI-Compatible JSON Request Payload:"
cat << 'EOF' > prompt.json
{
  "model": "facebook/opt-125m",
  "prompt": "The future of cloud-native datacenter engineering is",
  "max_tokens": 50,
  "temperature": 0.7
}
EOF
cat prompt.json
echo ""

echo ">>> [2/2] Firing Generative Request to Local vLLM Engine:"
echo "POST /v1/completions"
curl -s -X POST http://127.0.0.1:8000/v1/completions \
  -H "Content-Type: application/json" \
  -d @prompt.json | jq .

echo "--------------------------------------------------------"
echo "Notice how the response perfectly mimics the payload structure of OpenAI's API. Your applications cannot tell the difference between ChatGPT and your localized vLLM cluster."

kill $PF_PID
rm prompt.json
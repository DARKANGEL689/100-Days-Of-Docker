#!/bin/bash
echo "Auditing Multi-LoRA Dynamic Routing..."
echo "--------------------------------------------------------"

kubectl port-forward svc/multilora-api-svc 8000:8000 > /dev/null 2>&1 &
PF_PID=$!
sleep 3

echo ">>> [1/2] Firing Request to Base Model (facebook/opt-125m):"
cat << 'EOF' > base-prompt.json
{
  "model": "facebook/opt-125m",
  "prompt": "The capital of France is",
  "max_tokens": 15
}
EOF
curl -s -X POST http://127.0.0.1:8000/v1/completions -H "Content-Type: application/json" -d @base-prompt.json | jq .
echo ""

echo ">>> [2/2] Firing Request to Hot-Swapped SQL LoRA Adapter:"
cat << 'EOF' > lora-prompt.json
{
  "model": "sql-generator-lora",
  "prompt": "Create a table for users",
  "max_tokens": 15
}
EOF
echo "Routing inference through isolated attention matrices..."

curl -s -X POST http://127.0.0.1:8000/v1/completions -H "Content-Type: application/json" -d @lora-prompt.json

echo -e "\n--------------------------------------------------------"
echo "Notice the routing logic. The application developer simply changes the 'model' string, and the cluster handles the VRAM math automatically."

kill $PF_PID
rm base-prompt.json lora-prompt.json
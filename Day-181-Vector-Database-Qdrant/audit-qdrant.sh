#!/bin/bash
echo "Auditing Autonomous Vector Similarity Search..."
echo "--------------------------------------------------------"

kubectl port-forward svc/qdrant-api-svc 6333:6333 > /dev/null 2>&1 &
PF_PID=$!
sleep 3

echo ">>> [1/3] Initializing Vector Collection (Dimensions: 4, Metric: Cosine)..."
curl -s -X PUT http://127.0.0.1:6333/collections/enterprise_knowledge \
  -H 'Content-Type: application/json' \
  -d '{"vectors": {"size": 4, "distance": "Cosine"}}' | jq .
echo ""

echo ">>> [2/3] Injecting Private Knowledge Embeddings into Matrix..."
cat << 'EOF' > embeddings.json
{
  "points": [
    {
      "id": 1,
      "vector": [0.05, 0.61, 0.76, 0.74],
      "payload": {"document": "The Day 171 architecture utilizes Istio mTLS for encryption."}
    },
    {
      "id": 2,
      "vector": [0.19, 0.81, 0.75, 0.11],
      "payload": {"document": "Kubernetes Chaos Mesh is used on Day 162 for resilience."}
    }
  ]
}
EOF
curl -s -X PUT http://127.0.0.1:6333/collections/enterprise_knowledge/points \
  -H 'Content-Type: application/json' \
  -d @embeddings.json | jq .
echo ""

echo ">>> [3/3] Executing Mathematical RAG Retrieval Request..."
echo "Simulating LLM asking: 'What encrypts the Day 171 network?'"
echo "Searching for closest vector match..."
curl -s -X POST http://127.0.0.1:6333/collections/enterprise_knowledge/points/search \
  -H 'Content-Type: application/json' \
  -d '{"vector": [0.05, 0.60, 0.77, 0.73], "limit": 1, "with_payload": true}' | jq '.result[0].payload'

echo "--------------------------------------------------------"
echo "Notice how the database returned the exact Day 171 text based on mathematical proximity. This text is what you feed into the LLM prompt to eradicate hallucinations."

kill $PF_PID
rm embeddings.json
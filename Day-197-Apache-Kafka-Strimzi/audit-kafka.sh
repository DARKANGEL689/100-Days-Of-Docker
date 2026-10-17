#!/bin/bash
echo "Auditing Kafka Asynchronous Event Streaming..."
echo "--------------------------------------------------------"

echo ">>> [1/2] PRODUCER: Injecting 5 Asynchronous JSON Payloads into the Bus..."
cat << 'EOF' > payload-stream.json
{"timestamp": 1700000001, "node": "ray-worker-0", "event": "VRAM_SPIKE", "value": "98%"}
{"timestamp": 1700000002, "node": "mlflow-server", "event": "ARTIFACT_SAVED", "value": "opt-125m"}
{"timestamp": 1700000003, "node": "qdrant-db", "event": "VECTOR_EMBEDDING", "value": "success"}
{"timestamp": 1700000004, "node": "kserve-engine", "event": "TENSOR_PROCESSED", "value": "4ms"}
{"timestamp": 1700000005, "node": "gateway-api", "event": "CACHE_HIT", "value": "true"}
EOF

cat payload-stream.json | kubectl exec -i matrix-bus-kafka-0 -c kafka -- bin/kafka-console-producer.sh --bootstrap-server localhost:9092 --topic ai-telemetry-stream
echo "[SUCCESS] Payloads fired into the distributed log."
echo ""

echo ">>> [2/2] CONSUMER: Reading Real-Time Stream from Partition 0..."
kubectl exec -i matrix-bus-kafka-0 -c kafka -- bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic ai-telemetry-stream --from-beginning --max-messages 5

echo "--------------------------------------------------------"
echo "Notice that the producer did not wait for an HTTP 200 OK from a database. It simply dumped the data onto the bus. Any microservice in your cluster can now subscribe to 'ai-telemetry-stream' and consume this data at its own pace."

rm payload-stream.json
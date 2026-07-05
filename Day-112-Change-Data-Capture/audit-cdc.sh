#!/bin/bash
echo "Auditing Real-Time Change Data Capture Loop..."
echo "--------------------------------------------------------"

POSTGRES_POD=$(kubectl get pods -l app=postgres-oltp -o jsonpath='{.items[0].metadata.name}')

echo "[1] Simulating Application Layer Database Write..."
kubectl exec -i $POSTGRES_POD -- psql -U db_operator -d enterprise_vault -c "
INSERT INTO user_profiles (username, clearance_level) VALUES ('Ahad_Syed_Architect', 'Protocol-300');
"

echo "[2] Intercepting Low-Level WAL Stream out of Kafka Topic..."
echo "Reading from target generated topic: 'cdc_event.public.user_profiles'..."
echo "--------------------------------------------------------"

kubectl run kafka-consumer -ti --image=quay.io/strimzi/kafka:0.38.0-kafka-3.6.0 --rm=true --restart=Never -- \
  bin/kafka-console-consumer.sh --bootstrap-server kafka-cluster-kafka-brokers.default.svc:9092 \
  --topic cdc_event.public.user_profiles --from-beginning --max-messages 1

echo "--------------------------------------------------------"
echo "Payload capture complete. Notice the structured schema showing the fresh INSERT data map."
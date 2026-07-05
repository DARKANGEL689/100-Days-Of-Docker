#!/bin/bash
echo "Deploying Transactional OLTP Core with WAL Streaming Enabled..."
kubectl apply -f 1-postgres-source.yaml

echo "Deploying Debezium Kafka Connect Engine Framework..."
kubectl apply -f 2-debezium-connect.yaml

echo "Waiting for engines to attain full network availability..."
kubectl wait --for=condition=available deployment/production-oltp-db --timeout=120s
kubectl wait --for=condition=available deployment/debezium-cdc-engine --timeout=120s

echo "Seeding PostgreSQL Database with Enterprise Table Schemas..."
POSTGRES_POD=$(kubectl get pods -l app=postgres-oltp -o jsonpath='{.items[0].metadata.name}')

kubectl exec -i $POSTGRES_POD -- psql -U db_operator -d enterprise_vault -c "
CREATE TABLE IF NOT EXISTS user_profiles (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50),
    clearance_level VARCHAR(20),
    updated_at TIMESTAMP DEFAULT NOW()
);"

echo "Registering Declarative Debezium Connector Pipeline..."
CONNECT_POD=$(kubectl get pods -l app=debezium-connect -o jsonpath='{.items[0].metadata.name}')

sleep 5
kubectl cp 3-connector-config.json $CONNECT_POD:/tmp/config.json
kubectl exec -i $CONNECT_POD -- curl -X POST -H "Content-Type: application/json" --data @/tmp/config.json http://localhost:8083/connectors

echo ""
echo "--------------------------------------------------------"
echo "CDC ENGINE IS LIVE. All transactional mutations are now mapped to Kafka."
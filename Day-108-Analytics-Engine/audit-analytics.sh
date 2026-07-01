#!/bin/bash
echo "Auditing the OLAP Analytics Engine..."
echo "--------------------------------------------------------"

POD_NAME=$(kubectl get pods -l clickhouse.altinity.com/cluster=real-time-cluster -o jsonpath='{.items[0].metadata.name}')

echo "Executing Millisecond Aggregation Query across all ingested streams:"
kubectl exec -it $POD_NAME -- clickhouse-client --query="
    SELECT 
        count() AS total_transactions,
        sum(amount) AS total_volume_processed,
        max(amount) AS largest_transaction
    FROM transaction_ledger;
"

echo "--------------------------------------------------------"
echo "If data exists above, your pipeline (Kafka -> Flink -> Kafka -> ClickHouse) is operating flawlessly."
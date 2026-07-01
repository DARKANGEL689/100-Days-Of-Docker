CREATE TABLE IF NOT EXISTS transaction_queue (
    id String,
    amount Float64,
    status String
) ENGINE = Kafka
SETTINGS kafka_broker_list = 'kafka-cluster-kafka-brokers.default.svc:9092',
         kafka_topic_list = 'transaction-ledger',
         kafka_group_name = 'clickhouse_analytics_consumer',
         kafka_format = 'JSONEachRow';

CREATE TABLE IF NOT EXISTS transaction_ledger (
    ingestion_time DateTime DEFAULT now(),
    id String,
    amount Float64,
    status String
) ENGINE = MergeTree()
ORDER BY (ingestion_time, id);

CREATE MATERIALIZED VIEW IF NOT EXISTS transaction_mv TO transaction_ledger AS
SELECT 
    now() AS ingestion_time,
    id,
    amount,
    status
FROM transaction_queue;
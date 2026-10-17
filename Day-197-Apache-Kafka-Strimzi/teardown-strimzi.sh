#!/bin/bash
echo "Executing clean teardown of Day 197 Architecture..."
kubectl delete -f 2-kafka-topic.yaml --ignore-not-found
kubectl delete -f 1-kafka-cluster.yaml --ignore-not-found
helm uninstall strimzi-kafka -n strimzi-system
kubectl delete namespace strimzi-system --ignore-not-found
echo "Teardown complete. Kafka brokers and distributed logs flushed."
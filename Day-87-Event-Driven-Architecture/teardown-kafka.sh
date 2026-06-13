#!/bin/bash
echo "Executing clean teardown of Day 87 Architecture..."
kubectl delete -f 4-settlement-consumer.yaml --ignore-not-found
kubectl delete -f 3-payment-producer.yaml --ignore-not-found
kubectl delete -f 2-transaction-topic.yaml --ignore-not-found
kubectl delete -f 1-kafka-cluster.yaml --ignore-not-found
echo "Teardown complete. Strimzi Operator remains active."
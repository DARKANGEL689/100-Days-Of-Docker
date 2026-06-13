#!/bin/bash
echo "CRITICAL EVENT: Backend Settlement Service has crashed!"
kubectl delete deployment settlement-consumer -n kafka

echo "--------------------------------------------------------"
echo "The consumer is DEAD. But the Frontend Producer is still firing transactions!"
echo "Kafka is currently buffering the data safely in the broker..."

echo "Waiting 15 seconds to accumulate a backlog of events..."
sleep 15

echo "--------------------------------------------------------"
echo "Resolving outage. Resurrecting Backend Settlement Service..."
kubectl apply -f 4-settlement-consumer.yaml

echo "Waiting for pod to boot..."
kubectl wait --namespace kafka --for=condition=ready pod -l app=consumer --timeout=60s

echo "--------------------------------------------------------"
echo "Outage resolved! Watch the logs. The consumer will instantly process all the backlogged messages it missed while it was dead:"
kubectl logs deployment/settlement-consumer -n kafka -f
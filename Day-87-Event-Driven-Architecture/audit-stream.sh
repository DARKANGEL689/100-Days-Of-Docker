#!/bin/bash
echo "Auditing Live Kafka Event Stream..."
echo "--------------------------------------------------------"
echo "Watching the Backend Consumer process incoming financial events:"
echo "(Press Ctrl+C to exit)"
kubectl logs deployment/settlement-consumer -n kafka -f
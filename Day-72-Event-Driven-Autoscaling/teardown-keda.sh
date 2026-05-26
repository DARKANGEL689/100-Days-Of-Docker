#!/bin/bash
echo "Executing clean teardown of Day 72 Architecture..."
kubectl delete -f keda-scaledobject.yaml
kubectl delete -f keda-auth.yaml
kubectl delete -f worker-app.yaml
kubectl delete -f rabbitmq-broker.yaml
kubectl delete secret rabbitmq-secret
echo "Teardown complete. KEDA engine remains active."
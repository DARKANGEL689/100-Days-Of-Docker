#!/bin/bash
echo "Executing clean teardown of Day 71 Architecture..."
kubectl delete -f 4-microservice-svc.yaml
kubectl delete -f 3-microservice-demo.yaml
kubectl delete -f 2-jaeger-routing.yaml
kubectl delete -f 1-jaeger-engine.yaml
echo "Teardown complete. Tracing infrastructure dismantled."
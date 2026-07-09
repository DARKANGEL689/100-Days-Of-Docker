#!/bin/bash
echo "Injecting Protocol Buffer (Protobuf) Mathematical Contracts..."
kubectl apply -f 1-service-contract.yaml

echo "Injecting gRPC Server and Client Logic..."
kubectl apply -f 2-grpc-logic.yaml

echo "Deploying gRPC Edge Architecture (Executing dynamic Protobuf Compilation)..."
kubectl apply -f 3-grpc-architecture.yaml

echo "Waiting for the InitContainer to compile the Protobuf bindings and boot the HTTP/2 Server..."
sleep 5
kubectl wait --for=condition=available deployment/enterprise-grpc-core --timeout=120s

echo "The gRPC Service is ONLINE."
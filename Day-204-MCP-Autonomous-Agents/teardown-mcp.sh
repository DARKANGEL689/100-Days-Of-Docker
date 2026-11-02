#!/bin/bash
echo "Executing clean teardown of Day 204 Architecture..."
kubectl delete -f 2-mcp-agent-client.yaml --ignore-not-found
kubectl delete -f 1-mcp-server.yaml --ignore-not-found
echo "Teardown complete. Tool registries collapsed."
#!/bin/bash
echo "[DEPLOY] Provisioning Model Context Protocol (MCP) Server..."
kubectl apply -f 1-mcp-server.yaml

echo "[WAIT] Aligning SSE Transport Layer and Python Dependencies (20s)..."
sleep 20
kubectl wait --for=condition=available deployment/mcp-tool-registry --timeout=60s

echo "[DEPLOY] Injecting Autonomous AI Client Job..."
kubectl apply -f 2-mcp-agent-client.yaml

echo "MCP Matrix is ARMED. Security Agent is interrogating the registry."
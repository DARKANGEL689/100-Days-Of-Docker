#!/bin/bash
echo "Auditing Model Context Protocol Agent Capabilities..."
echo "--------------------------------------------------------"

echo "[WAIT] Awaiting Agentic ReAct Loop Completion (10s)..."
sleep 10

AGENT_POD=$(kubectl get pods -l job-name=autonomous-security-agent -o jsonpath='{.items[0].metadata.name}')

kubectl logs $AGENT_POD

echo "--------------------------------------------------------"
echo "By standardizing the tool interface via MCP, your AI models are no longer constrained to generating text. They can autonomously interact with any database, API, or hardware node you expose to them."
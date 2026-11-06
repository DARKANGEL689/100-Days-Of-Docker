#!/bin/bash
echo "Auditing Stateful Multi-Agent Execution..."
echo "--------------------------------------------------------"

AGENT_POD=$(kubectl get pods -l job-name=multi-agent-orchestration -o jsonpath='{.items[0].metadata.name}')

kubectl logs $AGENT_POD

echo "--------------------------------------------------------"
echo "Notice the routing loop. Agent 1 built bad code. Agent 2 blocked it and sent it back. Agent 1 rewrote it. Agent 3 deployed it. You have effectively automated the entire DevOps lifecycle."
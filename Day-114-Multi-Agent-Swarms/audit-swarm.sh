#!/bin/bash
echo "Auditing the Multi-Agent Conversation Protocol..."
echo "--------------------------------------------------------"

POD_NAME=$(kubectl get pods -l job-name=multi-agent-swarm-run -o jsonpath='{.items[0].metadata.name}')

kubectl logs $POD_NAME

echo "--------------------------------------------------------"
echo "If you saw the Auditor reject the code and the Engineer rewrite it, you have successfully deployed a self-correcting intelligence loop."
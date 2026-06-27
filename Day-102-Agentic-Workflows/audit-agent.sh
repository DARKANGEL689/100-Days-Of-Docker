#!/bin/bash
echo "Auditing Agentic Telemetry..."
echo "--------------------------------------------------------"

POD_NAME=$(kubectl get pods -l job-name=autonomous-diagnostics-run -o jsonpath='{.items[0].metadata.name}')

kubectl logs $POD_NAME

echo "--------------------------------------------------------"
echo "If you see '[SYSTEM] AI requested execution...', it means the LLM successfully wrote a command to access the physical API!"
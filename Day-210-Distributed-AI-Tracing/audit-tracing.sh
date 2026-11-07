#!/bin/bash
echo "Auditing Distributed AI Span Trees..."
echo "--------------------------------------------------------"

kubectl port-forward svc/jaeger-collector 16686:16686 > /dev/null 2>&1 &
PF_PID=$!
sleep 3

echo ">>> [1/2] EXTRACTING AGENT STDOUT:"
AGENT_POD=$(kubectl get pods -l job-name=otel-agent-job -o jsonpath='{.items[0].metadata.name}')
kubectl logs $AGENT_POD
echo ""

echo ">>> [2/2] VISUALIZING THE AI THOUGHT PROCESS:"
echo "Open your browser and navigate to: http://localhost:16686"
echo ""
echo "INSTRUCTIONS:"
echo "1. Under 'Service', select 'autonomous-security-agent'."
echo "2. Click 'Find Traces'."
echo "3. Click on the generated trace. You will see a beautiful, cascading waterfall graph proving exactly how many milliseconds the LLM took to think, versus how long it took to execute the MCP tool and query Qdrant."
echo "--------------------------------------------------------"
echo "Press [CTRL+C] to stop the port-forward when you are done analyzing the trace."

wait $PF_PID
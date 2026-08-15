#!/bin/bash
echo "Auditing DAG Execution Sequence..."
echo "--------------------------------------------------------"

WORKFLOW_NAME=$(kubectl get workflows -n default --sort-by=.metadata.creationTimestamp -o jsonpath='{.items[-1].metadata.name}')

echo "Monitoring Workflow: $WORKFLOW_NAME"
echo "Waiting for DAG completion (this will take ~15 seconds)..."

kubectl wait --for=condition=Completed workflow/$WORKFLOW_NAME --timeout=120s 2>/dev/null || true

echo ""
echo ">>> EXTRACTING MULTI-POD EXECUTION LOGS:"
kubectl logs -l workflows.argoproj.io/workflow=$WORKFLOW_NAME -c main

echo "--------------------------------------------------------"
echo "If Phase 1, 2, and 3 executed sequentially without overlap, your DAG is structurally flawless."
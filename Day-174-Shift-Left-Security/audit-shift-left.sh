#!/bin/bash
echo "Auditing Autonomous Shift-Left Validation..."
echo "--------------------------------------------------------"

echo "Executing Pipeline against Hardened Enterprise Workload (2-hardened-workload.yaml)..."

MSYS_NO_PATHCONV=1 docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image --severity CRITICAL --exit-code 1 nginx:alpine
TRIVY_STATUS=$?

MSYS_NO_PATHCONV=1 docker run --rm -v "$(pwd):/workspace" -w /workspace stackrox/kube-linter lint 2-hardened-workload.yaml
LINTER_STATUS=$?

if [ $TRIVY_STATUS -eq 0 ] && [ $LINTER_STATUS -eq 0 ]; then
    echo ""
    echo "[PIPELINE SUCCESS] All Shift-Left security gates cleared."
    echo "Deploying to cluster..."
    kubectl apply -f 2-hardened-workload.yaml
    sleep 3
    kubectl get pods -l app=frontend
else
    echo "[PIPELINE FAILED] Security gates triggered."
fi
echo "--------------------------------------------------------"
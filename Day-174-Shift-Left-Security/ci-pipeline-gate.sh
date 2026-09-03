#!/bin/bash
echo "[CI/CD PIPELINE] Initiating Shift-Left Security Scans..."
echo "--------------------------------------------------------"

IMAGE="nginx:1.14.2"
MANIFEST="1-vulnerable-workload.yaml"

echo ">>> [STAGE 1] Executing Trivy Container Vulnerability Scan on '$IMAGE'..."
MSYS_NO_PATHCONV=1 docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image --severity CRITICAL --exit-code 1 $IMAGE

if [ $? -ne 0 ]; then
    echo "[PIPELINE FAILED] Trivy detected CRITICAL zero-day vulnerabilities in the container image."
    echo "[ACTION] Build aborted. The payload will not be deployed."
    exit 1
fi
echo "[SUCCESS] Image passed CVE scanning."
echo ""

echo ">>> [STAGE 2] Executing KubeLinter Static YAML Analysis on '$MANIFEST'..."
MSYS_NO_PATHCONV=1 docker run --rm -v "$(pwd):/workspace" -w /workspace stackrox/kube-linter lint $MANIFEST

if [ $? -ne 0 ]; then
    echo "[PIPELINE FAILED] KubeLinter detected severe misconfigurations in the YAML manifest."
    echo "[ACTION] Build aborted. The payload will not be deployed."
    exit 1
fi

echo "[SUCCESS] YAML passed structural security validation."
echo "--------------------------------------------------------"
echo ">>> [STAGE 3] Executing Deployment to Production..."
kubectl apply -f $MANIFEST
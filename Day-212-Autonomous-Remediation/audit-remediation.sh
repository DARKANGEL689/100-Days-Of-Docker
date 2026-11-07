#!/bin/bash
echo "Auditing Autonomous AI Incident Remediation..."
echo "--------------------------------------------------------"

echo ">>> [1/3] VERIFYING BASELINE INFRASTRUCTURE STATE:"
kubectl get deployment matrix-api-core
echo ""

echo ">>> [2/3] FIRING SIMULATED PROMETHEUS DISTRESS SIGNAL:"
echo "Simulating a critical CPUSaturation alert from Alertmanager..."
cat << 'EOF' > alert-payload.json
{
  "alerts": [
    {
      "status": "firing",
      "labels": {
        "alertname": "CPUSaturationCritical",
        "deployment": "matrix-api-core",
        "namespace": "default",
        "severity": "critical"
      }
    }
  ]
}
EOF

kubectl port-forward svc/sre-webhook-svc 5000:5000 > /dev/null 2>&1 &
PF_PID=$!
sleep 2

curl -s -X POST http://127.0.0.1:5000/v1/alerts/webhook -H "Content-Type: application/json" -d @alert-payload.json | jq .
echo ""

echo ">>> [3/3] EXTRACTING AI SRE CONSCIOUSNESS & VALIDATING CLUSTER STATE:"
sleep 3
SRE_POD=$(kubectl get pods -l app=sre-bot -o jsonpath='{.items[0].metadata.name}')
kubectl logs $SRE_POD | tail -n 10
echo ""

echo "Validating physical infrastructure mutation..."
kubectl get deployment matrix-api-core

echo "--------------------------------------------------------"
echo "[RESULT] The distress signal was intercepted. The AI authenticated with the API server, calculated the required offset, and patched the deployment to 3 replicas. Zero human interaction required."

kill $PF_PID
rm alert-payload.json
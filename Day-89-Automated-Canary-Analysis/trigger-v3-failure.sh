#!/bin/bash
echo "Merging V3 (Red) Codebase..."
echo "Simulating a CATASTROPHIC test suite execution (HTTP 500 Error)."

cat <<EOF | kubectl apply -f -
apiVersion: argoproj.io/v1alpha1
kind: Rollout
metadata:
  name: enterprise-api
spec:
  template:
    spec:
      containers:
      - name: api
        image: argoproj/rollouts-demo:red # The broken feature
  strategy:
    canary:
      steps:
      - setWeight: 25
      - analysis:
          templates:
          - templateName: external-qa-gate
          args:
          - name: qa-status-url
            value: "https://httpstat.us/500" # QA RETURNS A MASSIVE FAILURE!
      - setWeight: 100
EOF
echo "V3 Deployment initiated. Watch the visualizer. Argo will instantly pull the killswitch!"
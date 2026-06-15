#!/bin/bash
echo "Merging V2 (Yellow) Codebase..."
echo "Simulating a FLAWLESS test suite execution."

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
        image: argoproj/rollouts-demo:yellow # The new feature
  strategy:
    canary:
      steps:
      - setWeight: 25
      - analysis:
          templates:
          - templateName: external-qa-gate
          args:
          - name: qa-status-url
            value: "https://httpstat.us/200" # QA RETURNS SUCCESS!
      - setWeight: 100
EOF
echo "V2 Deployment initiated. Watch the visualizer to see Argo autonomously promote it!"
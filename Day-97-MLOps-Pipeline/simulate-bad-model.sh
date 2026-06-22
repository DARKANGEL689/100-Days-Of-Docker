#!/bin/bash
echo "Simulating a model failure in the training pipeline..."

cat <<EOF | kubectl apply -f -
apiVersion: argoproj.io/v1alpha1
kind: Workflow
metadata:
  generateName: bad-model-simulation-
spec:
  entrypoint: fail-pipeline
  templates:
  - name: fail-pipeline
    container:
      image: alpine:latest
      command: [sh, -c, "echo 'Training accuracy: 0.05...'; exit 1"] # Simulating failure
EOF
echo "The factory has halted production to prevent bad model deployment."
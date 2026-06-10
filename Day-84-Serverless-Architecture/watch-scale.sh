#!/bin/bash
echo "Watching Kubernetes Pods in real-time..."
echo "Notice that after ~60 seconds of zero traffic, the pod will transition to 'Terminating'."
echo "(Press Ctrl+C to stop watching)"
echo "--------------------------------------------------------"
kubectl get pods -l serving.knative.dev/service=zero-scale-api -w
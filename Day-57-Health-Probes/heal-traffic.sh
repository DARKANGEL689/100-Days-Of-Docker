#!/bin/bash
echo "Healing the web server..."
kubectl exec readiness-pod -- /bin/sh -c 'echo "Restored" > /usr/share/nginx/html/index.html'
echo "File restored. Readiness Probe will succeed within 3 seconds."
kubectl get endpoints probe-service
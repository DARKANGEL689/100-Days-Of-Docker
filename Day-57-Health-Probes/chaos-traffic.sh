#!/bin/bash
echo "Executing Chaos Engineering: Deleting Nginx index file..."
kubectl exec readiness-pod -- rm /usr/share/nginx/html/index.html
echo "Index deleted. Readiness Probe will fail within 3 seconds."
echo "Watch the endpoints disappear (Press Ctrl+C to exit):"
kubectl get endpoints probe-service -w
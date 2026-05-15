#!/bin/bash
echo "Executing clean teardown of Day 60 Architecture..."
kubectl delete ingress enterprise-gateway
kubectl delete secret gateway-tls-secret
kubectl delete deployment web-frontend api-backend
kubectl delete svc frontend-svc backend-svc
echo "Teardown complete. Core Ingress Controller remains active for future use."
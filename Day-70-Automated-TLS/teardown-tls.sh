#!/bin/bash
echo "Executing clean teardown of Day 70 Architecture..."
kubectl delete -f 6-automated-ingress.yaml
kubectl delete -f 5-secure-svc.yaml
kubectl delete -f 4-secure-app.yaml
kubectl delete -f 3-global-cluster-issuer.yaml
kubectl delete -f 2-enterprise-ca-cert.yaml
kubectl delete -f 1-root-bootstrap.yaml
echo "Teardown complete. Cert-Manager engine remains active for future deployments."
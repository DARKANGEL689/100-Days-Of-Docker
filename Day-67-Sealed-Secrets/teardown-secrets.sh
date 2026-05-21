#!/bin/bash
echo "Executing clean teardown of Cryptographic Architecture..."
kubectl delete deployment secure-database-api
kubectl delete svc secure-api-svc
kubectl delete sealedsecret enterprise-db-credentials
echo "Teardown complete. Vault locked."
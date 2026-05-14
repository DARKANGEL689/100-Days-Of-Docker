#!/bin/bash
echo "Executing clean teardown of Day 59 Architecture..."
kubectl delete pod secure-database web-frontend compromised-container
kubectl delete svc database-svc
kubectl delete networkpolicy default-deny-all allow-frontend-to-db allow-dns-resolution
echo "Teardown complete. Network segmentation dissolved."
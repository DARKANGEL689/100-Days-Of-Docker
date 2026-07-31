#!/bin/bash
echo "Executing clean teardown of Day 140 Architecture..."
kubectl delete -f 2-enterprise-application.yaml --ignore-not-found
kubectl delete -f 1-gitops-project.yaml --ignore-not-found
echo "Teardown complete. Continuous delivery pipelines severed."
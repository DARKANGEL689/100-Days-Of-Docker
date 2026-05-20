#!/bin/bash
echo "Executing clean teardown of Kustomize Architectures..."
kubectl delete -k overlays/dev
kubectl delete -k overlays/prod
echo "Teardown complete."
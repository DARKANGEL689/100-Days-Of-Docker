#!/bin/bash
echo "Uploading Enterprise Architecture to the Backstage Database..."
kubectl apply -f 1-system-architecture.yaml
kubectl apply -f 2-catalog-component.yaml
kubectl apply -f 3-golden-path-template.yaml

echo "Software Catalog populated."
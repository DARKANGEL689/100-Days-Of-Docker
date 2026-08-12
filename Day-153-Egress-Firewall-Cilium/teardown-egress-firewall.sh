#!/bin/bash
echo "Executing clean teardown of Day 153 Architecture..."
kubectl delete -f 2-cilium-egress-policy.yaml --ignore-not-found
kubectl delete -f 1-untrusted-ai-worker.yaml --ignore-not-found
echo "Teardown complete. Security boundaries flushed."
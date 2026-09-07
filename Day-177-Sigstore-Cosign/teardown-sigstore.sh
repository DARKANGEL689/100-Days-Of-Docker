#!/bin/bash
echo "Executing clean teardown of Day 177 Architecture..."
kubectl delete -f 3-signed-secure-pod.yaml --ignore-not-found
kubectl delete -f 2-unsigned-rogue-pod.yaml --ignore-not-found
kubectl delete -f 1-kyverno-verify-policy.yaml --ignore-not-found
kubectl delete secret cosign-public-key -n default --ignore-not-found
rm cosign.key cosign.pub
echo "Teardown complete. Cryptographic keys destroyed."
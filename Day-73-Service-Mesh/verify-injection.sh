#!/bin/bash
echo "Auditing Sidecar Proxy Injection:"
echo "Look at the READY column. It should say '2/2', proving Envoy is running!"
kubectl get pods
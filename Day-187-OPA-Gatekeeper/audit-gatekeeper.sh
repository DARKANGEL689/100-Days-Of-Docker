#!/bin/bash
echo "Auditing OPA Gatekeeper Policy Enforcement..."
echo "--------------------------------------------------------"

echo ">>> [1/2] ATTEMPTING TO DEPLOY ROGUE UNBOUNDED POD:"
echo "Executing: kubectl apply (rogue-unbounded-pod)"


cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: rogue-unbounded-pod
  namespace: default
spec:
  containers:
  - name: rogue-container
    image: alpine:latest
    command: ["sleep", "3600"]
EOF
echo ""
echo "[EXPECTED RESULT] The API Server should return a 'Denied by Gatekeeper' fatal error."
echo ""

echo ">>> [2/2] ATTEMPTING TO DEPLOY COMPLIANT ENTERPRISE POD:"
echo "Executing: kubectl apply (compliant-enterprise-pod)"
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: compliant-enterprise-pod
  namespace: default
spec:
  containers:
  - name: enterprise-container
    image: alpine:latest
    command: ["sleep", "3600"]
    resources:
      limits:
        cpu: "100m"
        memory: "128Mi"
EOF
echo ""
echo "[EXPECTED RESULT] The API Server should accept the pod and return 'created'."
echo "--------------------------------------------------------"
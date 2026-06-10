#!/bin/bash
echo "Compiling Kyverno Supply Chain Policy..."

PUB_KEY=$(cat cosign.pub | sed 's/^/                    /')

cat <<EOF > 1-crypto-policy.yaml
apiVersion: kyverno.io/v1
kind: ClusterPolicy
metadata:
  name: require-signed-images
spec:
  validationFailureAction: Enforce
  background: false
  rules:
    - name: verify-signature
      match:
        any:
        - resources:
            kinds:
              - Pod
      verifyImages:
      - imageReferences:
        - "darkangel689/alpha-node:*"
        attestors:
        - count: 1
          entries:
          - keys:
              publicKeys: |-
$PUB_KEY
EOF

echo "Policy compiled. Enforcing Martial Law..."
kubectl apply -f 1-crypto-policy.yaml
echo "The cluster will now violently reject unsigned images."
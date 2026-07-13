#!/bin/bash
echo "Registering strict cryptographic rules into the SPIRE Server..."
SPIRE_SERVER_POD=$(kubectl get pod -n spire-system -l app.kubernetes.io/name=spire-server -o jsonpath='{.items[0].metadata.name}')

kubectl exec -n spire-system $SPIRE_SERVER_POD -c spire-server -- \
  /opt/spire/bin/spire-server entry create \
  -spiffeID spiffe://enterprise.local/ns/spire-system/sa/spire-agent \
  -selector k8s_sat:cluster:enterprise-global-fleet \
  -selector k8s_sat:agent_ns:spire-system \
  -selector k8s_sat:agent_sa:spire-agent \
  -node

kubectl exec -n spire-system $SPIRE_SERVER_POD -c spire-server -- \
  /opt/spire/bin/spire-server entry create \
  -spiffeID spiffe://enterprise.local/vault/accessor \
  -parentID spiffe://enterprise.local/ns/spire-system/sa/spire-agent \
  -selector k8s:ns:default \
  -selector k8s:sa:vault-accessor

echo "Cryptographic constraints successfully registered."
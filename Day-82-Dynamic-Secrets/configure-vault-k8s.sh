#!/bin/bash
echo "Establishing Vault-to-Kubernetes Trust..."

kubectl exec vault-0 -- vault auth enable kubernetes

kubectl exec vault-0 -- sh -c 'vault write auth/kubernetes/config kubernetes_host="https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_SERVICE_PORT"'

kubectl exec vault-0 -- sh -c 'vault policy write app-policy - <<EOF
path "database/creds/app-role" { capabilities = ["read"] }
EOF'

kubectl exec vault-0 -- vault write auth/kubernetes/role/app-role \
    bound_service_account_names=vault-auth-sa \
    bound_service_account_namespaces=default \
    policies=app-policy \
    ttl=24h

echo "Kubernetes Authentication linked. Applications can now authenticate natively."
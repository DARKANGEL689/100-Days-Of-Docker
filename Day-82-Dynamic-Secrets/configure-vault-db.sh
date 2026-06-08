#!/bin/bash
echo "Configuring Vault Database Secrets Engine..."

kubectl exec vault-0 -- vault secrets enable database

kubectl exec vault-0 -- vault write database/config/my-postgres \
    plugin_name=postgresql-database-plugin \
    allowed_roles="app-role" \
    connection_url="postgresql://{{username}}:{{password}}@postgres-svc.default.svc.cluster.local:5432/postgres?sslmode=disable" \
    username="postgres" \
    password="supersecretroot"

kubectl exec vault-0 -- vault write database/roles/app-role \
    db_name=my-postgres \
    creation_statements="CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; GRANT SELECT ON ALL TABLES IN SCHEMA public TO \"{{name}}\";" \
    default_ttl="1h" \
    max_ttl="24h"

echo "Database Engine configured. Vault can now generate dynamic Postgres credentials."
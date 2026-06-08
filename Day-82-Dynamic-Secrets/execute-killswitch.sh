#!/bin/bash
echo "SECURITY BREACH DETECTED. Executing Credential Killswitch..."
echo "Instructing Vault to revoke all active database leases..."

kubectl exec vault-0 -- vault lease revoke -prefix database/creds/app-role

echo "All dynamic credentials have been assassinated."
# Day 25: Enterprise IAM, RBAC, and Token Security

Today marks the 25% milestone. I secured the Kubernetes Control Plane by engineering a strict Identity and Access Management (IAM) architecture, moving from Namespace-level isolation to Global Cluster Governance.

## Architecture & Security Implemented:
1. **Isolated Workspaces:** Provisioned partitioned `Namespaces` to act as secure deployment sandboxes.
2. **Least Privilege Governance:** Authored explicit `Roles` that permit application deployment but strictly deny destructive actions and sensitive data access.
3. **Global Auditing:** Architected `ClusterRoles` and `ClusterRoleBindings` to provide Read-Only, cross-namespace visibility for security compliance auditing.
4. **Impersonation Auditing:** Executed `kubectl auth can-i --as` security audits to mathematically validate boundary restrictions and Zero-Trust API compliance.
5. **Token Exfiltration Defense:** Hardened workload deployment manifests by explicitly configuring `automountServiceAccountToken: false`, preventing malicious API access via compromised public containers.
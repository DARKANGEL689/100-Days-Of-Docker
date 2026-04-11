# Day 25: Identity and Access Management (RBAC)

Today marks the 25% milestone. I secured the Kubernetes Control Plane by engineering a strict Identity and Access Management (IAM) architecture using RBAC to prevent insider threats and misconfigurations.

## Architecture & Security Implemented:
1. **Isolated Workspaces:** Provisioned partitioned `Namespaces` to act as secure deployment sandboxes.
2. **Machine Identities:** Generated `ServiceAccounts` to represent external CI/CD pipelines and restricted developer access.
3. **Least Privilege Governance:** Authored explicit `Roles` that permit application deployment (`create`, `update`) but strictly deny destructive actions (`delete`) and sensitive data access (`secrets`).
4. **Policy Enforcement:** Engineered `RoleBindings` to attach security policies to specific identities.
5. **Impersonation Auditing:** Executed `kubectl auth can-i --as` security audits to mathematically validate boundary restrictions and prove Zero-Trust compliance at the API layer.
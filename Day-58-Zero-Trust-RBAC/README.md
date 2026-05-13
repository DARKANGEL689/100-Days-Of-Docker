## Day 58: Zero Trust Architecture (RBAC & ServiceAccounts)

**Objective:** Engineer a Zero Trust internal security perimeter by replacing implicit pod trust with strict, identity-based authorization.

### Architecture & Engineering Logs
1. **Identity Provisioning:** Engineered custom `ServiceAccounts` to decouple application identities from the default cluster tokens.
2. **Namespace Isolation:** Authored `Role` manifests enforcing the Principle of Least Privilege (e.g., Read-Only access to specific resources).
3. **Identity Binding:** Engineered `RoleBindings` to securely map authorization rulesets to workload identities.
4. **Global Authorization:** Architected `ClusterRoles` and `ClusterRoleBindings` for cross-namespace and hardware-level (Node) API access.
5. **Penetration Testing:** Authored imperative bash utilities to extract injected Bearer tokens from live containers and audit Kube-API HTTP responses (Validating 403 Forbidden vs 200 OK boundaries).
# Day 14: Advanced Role-Based Access Control (RBAC)

Today, I secured the cluster infrastructure by implementing strict access policies, moving from basic namespace isolation to advanced, enterprise-grade identity management.

## Security Architecture Implemented (10 Contributions):
1. **Identity Management:** Provisioned scoped `ServiceAccounts` for non-human interactions.
2. **Principle of Least Privilege:** Authored restrictive `Roles` mapping specific API groups to read-only verbs.
3. **Authorization Mapping:** Secured identities via `RoleBindings`.
4. **Global Scoping:** Engineered `ClusterRoles` and `ClusterRoleBindings` to expose node-level architecture safely.
5. **Pinpoint Restrictions:** Implemented `resourceNames` to restrict API verbs to single, explicitly named infrastructure components.
6. **Dynamic Scaling:** Utilized `aggregationRule` for automated, label-based ClusterRole merging.
7. **Auditing:** Verified permission matrices using `kubectl auth can-i --as` impersonation tests.
# Day 14: Role-Based Access Control (RBAC)

Today, I secured the cluster infrastructure by implementing strict access policies and removing default administrative privileges from internal actors.

## Security Architecture Implemented:
1. **Identity Management:** Provisioned scoped `ServiceAccounts` for non-human cluster interaction.
2. **Principle of Least Privilege:** Authored `Roles` that strictly define allowed API groups, resources, and verbs.
3. **Authorization:** Mapped identities to permissions using exact `RoleBindings`.
4. **Global Scoping:** Implemented `ClusterRoles` to safely expose cluster-wide resources (like Nodes) without compromising namespace isolation.
5. **Auditing:** Verified permission matrices using `kubectl auth can-i` impersonation commands.
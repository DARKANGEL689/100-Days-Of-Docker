## Day 49: Kubernetes RBAC (Role-Based Access Control)
1. **Identity Provisioning:** Deployed localized `ServiceAccount` identities to simulate external human actors.
2. **Zero-Trust Baseline:** Validated the implicit deny posture for unassigned cluster identities.
3. **Role Engineering:** Authored bounded `Role` manifests enforcing the principle of least privilege for specific API resources.
4. **Boundary Testing:** Executed simulated lateral escalations and destructive actions, validating physical cluster blocks via `auth can-i`.
5. **Global Architecture:** Upgraded to `ClusterRole` and `ClusterRoleBinding` to manage cluster-wide, cross-namespace permissions.
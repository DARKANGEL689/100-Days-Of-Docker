## Day 82: Dynamic Secrets & Just-In-Time Credentials (HashiCorp Vault)

**Objective:** Deprecate static, long-lived infrastructure credentials by engineering HashiCorp Vault to autonomously generate ephemeral, time-to-live (TTL) bound database roles, injected securely via Kubernetes native ServiceAccount authentication.

### Architecture & Engineering Logs
1. **Engine Provisioning:** Deployed the HashiCorp Vault controller and Agent Injector mutating webhook via Helm.
2. **Database Secrets Engine:** Programmatically authenticated Vault directly to a PostgreSQL API, establishing algorithmic query templates for Just-In-Time role creation.
3. **Identity Federation:** Engineered K8s Auth Method bindings, allowing pods to securely authenticate to Vault utilizing natively mounted ServiceAccount JWTs.
4. **Autonomous Injection:** Authored Deployment annotations triggering the Vault sidecar to intercept pod initialization, fetch dynamic TTL-bound credentials, and render them securely into memory-backed `tmpfs` mounts.
5. **Instant Revocation:** Validated Vault's immediate lease revocation capabilities, severing active database connections and destroying credentials on-demand to mitigate active breach scenarios.
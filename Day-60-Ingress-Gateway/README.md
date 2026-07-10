## Day 60: The Grand Gatekeeper (Ingress Controllers & TLS)

**Objective:** Engineer Layer 7 Enterprise Routing to securely expose cluster services using path-based routing, SSL/TLS termination, and HTTP-to-HTTPS redirection.

### Architecture & Engineering Logs
1. **Controller Provisioning:** Deployed the official `ingress-nginx` controller to act as the global edge router for the cluster.
2. **Workload Deployment:** Engineered isolated frontend (Nginx) and backend (HTTP-Echo) deployments with internal ClusterIP services.
3. **Layer 7 Routing:** Authored `Ingress` manifests to perform path-based traffic splitting (`/api` -> backend, `/` -> frontend) utilizing `rewrite-target` annotations.
4. **Routing Validation:** Scripted host-header injection utilities (`curl`) to validate localized virtual host routing bypassing OS-level DNS modifications.
5. **Cryptographic Generation:** Engineered autonomous OpenSSL scripts to generate self-signed RSA-2048 keypairs and directly inject them into the `Secret` vault.
6. **TLS Termination:** Upgraded Ingress payloads to mount the TLS Secret, enabling edge decryption and forcible `ssl-redirect` behaviors.
7. **Security Auditing:** Validated HTTP 308 Permanent Redirects and encrypted HTTPS payload delivery.
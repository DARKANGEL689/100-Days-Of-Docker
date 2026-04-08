# Day 21: Enterprise Edge Security (Cert-Manager, TLS, HSTS)

Today, I hardened the cluster's edge routing by implementing automated TLS encryption and strict traffic policies to achieve a Zero-Trust local gateway.

## Architecture Implemented:
1. **Automated PKI:** Deployed `cert-manager` to handle the dynamic lifecycle of TLS/SSL certificates across the cluster.
2. **Local Certificate Authority:** Engineered a self-signed `ClusterIssuer` to act as the root of trust for local development domains.
3. **Declarative Certificates:** Authored explicit `Certificate` CRDs managing precise RSA-2048 key generation, 90-day lifecycles, and Wildcard Subject Alternative Names (SANs).
4. **Traffic Enforcement:** Upgraded NGINX Ingress controllers with `force-ssl-redirect` to permanently terminate port 80 traffic.
5. **Protocol Hardening:** Injected `HSTS` (HTTP Strict Transport Security) headers to prevent downgrade attacks.
6. **Production Readiness:** Scaffolded ACME HTTP-01 `ClusterIssuers` for seamless migration to Let's Encrypt public authorities.
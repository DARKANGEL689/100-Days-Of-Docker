# Day 21: Zero-Trust Security with Cert-Manager and TLS

Today, I hardened the cluster's edge routing by implementing automated TLS encryption using `cert-manager`.

## Architecture Implemented:
1. **Automated PKI:** Deployed `cert-manager` to handle the dynamic lifecycle of TLS/SSL certificates across the cluster.
2. **Local Certificate Authority:** Engineered a self-signed `ClusterIssuer` to act as the root of trust for local development domains.
3. **TLS Termination:** Upgraded NGINX Ingress resources with TLS blocks and issuer annotations, successfully encrypting edge traffic (HTTPS) and securing payload transmissions.
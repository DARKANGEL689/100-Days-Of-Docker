## Day 70: Zero-Touch Cryptography (Cert-Manager)

**Objective:** Deprecate manual OpenSSL certificate generation by engineering an autonomous cryptographic pipeline utilizing `cert-manager` for on-the-fly TLS provisioning and automatic expiration renewals.

### Architecture & Engineering Logs
1. **Engine Provisioning:** Deployed the `cert-manager` Helm chart and foundational Custom Resource Definitions to the cluster.
2. **Root Authority Generation:** Engineered a `SelfSigned` ClusterIssuer to bootstrap a localized Enterprise Certificate Authority (CA) Root keypair.
3. **Global Issuance:** Authored a production-grade `CA` ClusterIssuer to act as the global cryptographic signing authority for the cluster edge.
4. **Autonomous Interception:** Engineered Nginx Ingress manifests featuring `cert-manager.io/cluster-issuer` annotations, triggering automated background `CertificateRequest` pipelines.
5. **Secret Injection:** Validated the autonomous generation and injection of encrypted TLS keypairs directly into edge-routing `Secret` volumes.
6. **Cryptographic Auditing:** Scripted verbose `curl` utilities to extract and validate TLS handshake metadata (`subject`, `issuer`) at the network layer.
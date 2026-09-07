## Day 177: Supply Chain Security & Image Signing (Sigstore/Cosign)

**Objective:** Guarantee absolute code provenance and prevent supply chain poisoning by enforcing mathematically rigorous cryptographic signature validation prior to execution in the Kubernetes cluster.

### Architecture & Engineering Logs
1. **Cryptographic Key Generation:** Utilized the Sigstore Cosign engine to generate an isolated ECDSA public/private keypair, mapping the public key to a native Kubernetes Secret accessible by the control plane.
2. **Signature Materialization:** Cryptographically signed the SHA256 digest of an OCI container image and pushed the immutable signature artifact directly to the external registry alongside the payload.
3. **Admission Control Validation:** Authored a Kyverno `ClusterPolicy` utilizing the `verifyImages` engine. The policy actively intercepts API creation requests, queries the OCI registry for the attached Cosign signature, and mathematically validates it against the cluster's stored public key.
4. **Enforcement Audit:** Executed a live supply-chain penetration test, validating that unauthenticated tampered images are instantly blocked by the admission controller with a deterministic failure code, while verified signatures successfully mutate the deployment to enforce the exact SHA256 image digest.
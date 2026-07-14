## Day 122: Software Supply Chain Security (Sigstore & Kyverno)

**Objective:** Deprecate vulnerability to CI/CD supply chain poisoning by engineering cryptographic image verification at the cluster edge. Utilizing Sigstore (Cosign) to generate asymmetric keypairs, and deploying Kyverno as an Admission Controller to enforce strict `ClusterPolicies` that mathematically block the instantiation of unsigned OCI artifacts.

### Architecture & Engineering Logs
1. **Key Generation:** Utilized the `cosign` binary to generate offline Elliptic Curve asymmetric keypairs for enterprise payload signing.
2. **Policy Engine Provisioning:** Deployed the Kyverno admission controller via Helm, hooking directly into the `MutatingAdmissionWebhook` and `ValidatingAdmissionWebhook` Kubernetes APIs.
3. **Zero-Trust Enforcement:** Authored `verifyImages` policy declarations, injecting the Enterprise Public Key into the cluster state. The policy enforces a hard mathematical failure action against any pod initiating an unsigned image pull.
4. **Threat Validation:** Executed physical deployment attempts using unverified, public registry payloads. Mathematically validated the immediate rejection of the workload by the Kubernetes API kernel.
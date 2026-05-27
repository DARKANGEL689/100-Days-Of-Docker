## Day 74: Policy-as-Code (OPA Gatekeeper)

**Objective:** Deprecate reliance on manual code reviews by engineering Open Policy Agent (OPA) Validating Admission Webhooks to physically enforce configuration constraints at the Kubernetes API layer.

### Architecture & Engineering Logs
1. **Engine Provisioning:** Deployed the OPA Gatekeeper Helm chart, establishing secure admission controller webhooks directly intercepting API server transit.
2. **Cryptographic Logic (Rego):** Authored a `ConstraintTemplate` utilizing the Rego language to programmatically parse workload JSON payloads and intercept unpinned (`:latest`) container image tags.
3. **Targeted Enforcement:** Engineered a `K8sBlockLatestTag` Constraint binding the Rego logic exclusively to `Pod` creations within the `default` namespace.
4. **API Penetration Testing:** Validated immediate webhook rejection of non-compliant workloads during `kubectl apply`, effectively establishing absolute Policy-as-Code governance over human deployment errors.
5. **Continuous Auditing:** Scripted JSONPath extraction utilities to query the Gatekeeper Operator for pre-existing namespace violations detected during background sweeps.
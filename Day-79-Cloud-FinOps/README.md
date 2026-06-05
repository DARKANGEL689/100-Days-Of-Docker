## Day 79: Cloud FinOps & Cost Governance (Kubecost)

**Objective:** Engineer a centralized financial observability plane utilizing Kubecost to track, allocate, and visualize physical cloud spend at the pod/namespace level, and enforce strict API-level `ResourceQuotas` to govern budget limits.

### Architecture & Engineering Logs
1. **Engine Provisioning:** Deployed the Kubecost Cost Analyzer via Helm to intercept and financially translate Prometheus telemetry.
2. **Billing Simulation:** Provisioned unoptimized ("Rogue") workloads requesting heavily inflated compute resources (4 CPU / 8Gi Memory) alongside optimized baseline deployments.
3. **Financial Telemetry:** Scripted direct interrogations against the `/model/allocation` REST API to extract raw JSON billing metrics.
4. **Budget Enforcement (Guardrails):** Authored strict `ResourceQuota` manifests enforcing a hard namespace-level compute ceiling.
5. **Chaos Engineering (Financial Eviction):** Validated the Kubernetes API scheduler autonomously rejecting and terminating workloads that violate the pre-defined budget parameters, ensuring strict cost control.
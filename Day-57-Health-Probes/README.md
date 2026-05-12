## Day 57: Self-Healing Architecture (Health Probes)

**Objective:** Engineer autonomous cluster-level monitoring to dynamically heal deadlocked containers, control load balancer traffic, and protect heavy startup sequences.

### Architecture & Engineering Logs
1. **Liveness Probes:** Engineered file-based execution probes to identify silent deadlocks and trigger autonomous container assassinations.
2. **Readiness Probes:** Implemented `httpGet` probes tied to Kubernetes Services to dynamically route traffic away from unready or overloaded pods.
3. **Startup Probes:** Configured extended failure thresholds to shield heavy legacy applications from premature Liveness terminations during boot.
4. **Chaos Engineering:** Authored imperative scripts to manually induce application failures and audit the cluster's real-time autonomous response.
5. **Telemetry Auditing:** Scripted log extraction utilities to verify exact `RESTART` counts and API `Killing` events.
## Day 118: Multi-Cluster Fleet Orchestration (Karmada)

**Objective:** Deprecate single-cluster vulnerabilities by engineering a unified multi-cloud Control Plane. Utilizing Karmada to dynamically orchestrate, shatter, and schedule agnostic Kubernetes workloads across disparate geographic regions (AWS/GCP/Azure) via algorithmic `PropagationPolicies`.

### Architecture & Engineering Logs
1. **Fleet Commander Provisioning:** Bootstrapped the Karmada Control Plane, establishing an API-compatible overlay capable of registering and pinging remote worker clusters globally.
2. **Geographic Scheduling:** Authored `PropagationPolicy` CRDs to extract hardcoded topology definitions from workloads, delegating dynamic `AvailableReplicas` weight scheduling to the orchestrator.
3. **Dynamic Regional Overrides:** Engineered `OverridePolicy` injection vectors to mutate JSON paths in-flight, successfully appending GDPR compliance variables explicitly to workloads bound for European data centers.
4. **Global Telemetry:** Utilized `karmadactl` APIs to aggregate cross-cloud pod states into a single unified terminal view, proving total disaster recovery scheduling capabilities.
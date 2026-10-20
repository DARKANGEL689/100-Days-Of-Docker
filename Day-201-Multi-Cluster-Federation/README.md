## Day 201: Multi-Cluster Federation (Karmada)

**Objective:** Transcend single-datacenter hardware limitations by engineering a centralized, multi-cloud federation control plane capable of dynamically scheduling, fracturing, and distributing workloads across geographically isolated Kubernetes clusters.

### Architecture & Engineering Logs
1. **Control Plane Provisioning:** Deployed the CNCF Karmada orchestration engine, establishing a "God Cluster" API layer designed to manage fleet-wide state rather than local physical nodes.
2. **Federation Strategy:** Authored a `PropagationPolicy` CRD utilizing `replicaSchedulingType: Divided`. Enforced a strict mathematical 1:1 weight distribution ratio across distinct remote cluster registries (`member-cluster-aws`, `member-cluster-gcp`).
3. **Distribution Audit:** Executed a standard `Deployment` payload against the central API. Validated the `ResourceBinding` mechanisms that autonomously intercepted the 4-replica request and physically provisioned the split architecture across the simulated multi-cloud edge, proving zero-friction global scalability.
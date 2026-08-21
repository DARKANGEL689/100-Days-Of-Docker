## Day 162: Chaos Engineering & Resilience Testing (Chaos Mesh)

**Objective:** Mathematically prove architectural antifragility and ReplicaSet auto-healing capabilities by autonomously injecting fatal faults into live cluster environments. Engineered a continuous Chaos Engineering loop using Chaos Mesh to validate system survival during random compute node loss.

### Architecture & Engineering Logs
1. **Target Baseline Provisioning:** Deployed a highly available 3-replica NGINX API deployment to serve as the baseline testing target.
2. **Chaos Controller Deployment:** Installed the CNCF Chaos Mesh suite via Helm, mapping host socket paths to allow the Chaos Daemons direct privileged access to the container runtime (containerd).
3. **Autonomous Fault Injection:** Authored a `PodChaos` CRD executing a Cron-scheduled attack matrix (`@every 10s`). The policy algorithmically isolates and terminates a single pod from the target selector pool.
4. **Resilience Audit:** Scripted a real-time watch interface to validate the Kubernetes control plane's instantaneous detection of structural divergence and subsequent automated container resurrection, proving zero-downtime survival.
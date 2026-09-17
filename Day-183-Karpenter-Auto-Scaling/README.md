## Day 183: Just-In-Time Node Auto-Scaling (Karpenter)

**Objective:** Achieve limitless compute scalability and sub-second hardware provisioning by engineering a serverless node auto-scaling architecture capable of bypassing rigid, pre-defined Auto Scaling Groups.

### Architecture & Engineering Logs
1. **API Schema Injection:** Provisioned the official Karpenter CRDs into the local Kubernetes control plane to establish the API geometry required for dynamic cloud-provider compute interfacing.
2. **Compute Fleet Engineering:** Authored a `NodePool` CRD instructing the engine to strictly purchase heavily discounted `spot` instances from the `g5` GPU-accelerated EC2 instance family. 
3. **Financial Disruption Policy:** Hardcoded a `consolidationPolicy: WhenEmpty` rule with a 30-second Time-To-Live (TTL), guaranteeing that raw physical hardware is autonomously terminated the moment AI workloads scale down, eradicating idle cloud expenditure.
4. **Capacity Interception Audit:** Triggered a deliberate `FailedScheduling` event by submitting a massive 4-GPU tensor workload. Audited the scheduler distress signals utilized by Karpenter webhooks to dynamically calculate and procure raw silicon.
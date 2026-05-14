## Day 59: Zero Trust Networking (Network Policies)

**Objective:** Engineer network-level micro-segmentation to prevent unauthorized lateral movement and external data exfiltration within the Kubernetes cluster.

### Architecture & Engineering Logs
1. **Target Provisioning:** Deployed isolated backend database pods and routing services.
2. **Actor Simulation:** Deployed explicitly authorized frontend workloads alongside unauthorized rogue containers.
3. **Iron Curtain (Default Deny):** Engineered a blanket `NetworkPolicy` to sever all implicit Ingress and Egress namespace communications.
4. **Surgical Pinholing:** Authored explicit `Ingress` rules allowing strict port-level traffic driven entirely by pod label selectors.
5. **DNS Restoration:** Engineered core `Egress` rules to re-enable internal UDP/TCP port 53 resolution for the `kube-dns` service.
6. **Penetration Testing:** Executed internal port-scanning utilities (`netcat`) to validate lateral movement boundaries.
7. **Exfiltration Auditing:** Validated external Egress blocks to prevent outbound internet requests from compromised containers.
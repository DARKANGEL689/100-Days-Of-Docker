## Day 80: Runtime Threat Detection (Falco & eBPF)

**Objective:** Engineer a zero-overhead runtime security layer by deploying Falco as a DaemonSet, utilizing modern eBPF (Extended Berkeley Packet Filter) to intercept anomalous Linux kernel system calls and detect active container breaches in real-time.

### Architecture & Engineering Logs
1. **Engine Provisioning:** Deployed the Falco Security controller via Helm, bypassing legacy kernel modules in favor of highly performant `modern_ebpf` drivers.
2. **Target Provisioning:** Deployed a standard baseline Nginx workload to act as the target for penetration testing.
3. **Execution Simulation (Terminal):** Engineered synthetic chaos scripts to simulate Remote Code Execution (RCE), triggering Falco's "Terminal shell in container" detection rules.
4. **Exfiltration Simulation (File Read):** Scripted unauthorized access attempts against `/etc/shadow`, triggering Falco's "Read sensitive file" telemetry.
5. **Mutation Simulation (Binary Write):** Scripted synthetic malware injection into system `$PATH` directories, triggering Falco's "Write below binary dir" alarms.
6. **Telemetry Auditing:** Authored log extraction pipelines to physically validate eBPF kernel interceptions and confirm the generation of actionable security events.
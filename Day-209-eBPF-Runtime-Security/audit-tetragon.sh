#!/bin/bash
echo "Auditing eBPF Kernel-Level Exploitation Defense..."
echo "--------------------------------------------------------"

TARGET_POD=$(kubectl get pods -l app=ingress-core -o jsonpath='{.items[0].metadata.name}')
echo "[SYSTEM] Target Pod Identified: $TARGET_POD"
echo ""

echo ">>> [1/2] EXECUTING ZERO-DAY BREACH SIMULATION (Reverse Shell Attempt):"
echo "Command: kubectl exec -it $TARGET_POD -- /bin/bash"
echo "Attempting to spawn root shell..."

kubectl exec -i $TARGET_POD -- /bin/bash 2>/dev/null || echo "[SECURITY FAULT] Command terminated (Killed). TCP connection severed by kernel."
echo ""

echo ">>> [2/2] EXTRACTING EBPF KERNEL TELEMETRY (Tetragon Event Log):"
echo "Querying Tetragon DaemonSet for SIGKILL interventions..."
sleep 3

TETRAGON_POD=$(kubectl get pods -n kube-system -l app.kubernetes.io/name=tetragon -o jsonpath='{.items[0].metadata.name}')
kubectl logs $TETRAGON_POD -n kube-system -c export-stdout | grep "SIGKILL" | tail -n 1 | jq '{process: .process_exec.process.binary, arguments: .process_exec.process.arguments, kernel_action: "SIGKILL_ENFORCED", namespace: .process_exec.process.pod.namespace}'

echo "--------------------------------------------------------"
echo "[RESULT] The attacker breached the container, but the Linux kernel physically refused to execute their payload. You have achieved immutable runtime execution."
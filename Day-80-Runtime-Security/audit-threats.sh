#!/bin/bash
echo "Auditing Falco Kernel Logs for Runtime Security Violations..."
echo "-------------------------------------------------------------"

kubectl logs daemonset/enterprise-falco -n falco-system | grep -E "Notice|Warning|Error" | tail -n 10

echo "-------------------------------------------------------------"
echo "If you see 'A shell was spawned' or 'Read sensitive file untrusted', Falco successfully caught the hacker!"
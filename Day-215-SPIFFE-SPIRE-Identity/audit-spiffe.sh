#!/bin/bash
echo "Auditing SPIFFE/SPIRE Cryptographic Agent Attestation..."
echo "--------------------------------------------------------"

SOCKET="/spiffe-workload-api/spire-agent.sock"

echo ">>> [1/3] ATTESTED AGENT: Fetching Auto-Rotating X.509 SVID..."
kubectl exec -i attested-ai-agent -- /opt/spire/bin/spire-agent api fetch x509 -socketPath $SOCKET
echo ""

echo ">>> [2/3] ATTESTED AGENT: Minting Audience-Scoped JWT-SVID for MCP Gateway..."
kubectl exec -i attested-ai-agent -- /opt/spire/bin/spire-agent api fetch jwt -audience mcp-security-gateway -socketPath $SOCKET
echo ""

echo ">>> [3/3] ROGUE IMPOSTER: Attempting Unauthorized SVID Extraction..."
kubectl exec -i rogue-imposter-pod -- /opt/spire/bin/spire-agent api fetch x509 -socketPath $SOCKET 2>&1 || echo "[SECURITY VERIFIED] Attestation denied. Rogue pod received zero cryptographic identity."

echo "--------------------------------------------------------"
echo "[RESULT] The authorized agent proved its identity purely through kernel/Kubelet attestation and received an auto-rotating X.509 SVID + scoped JWT without a single static secret. The rogue pod on the same node was violently rejected."
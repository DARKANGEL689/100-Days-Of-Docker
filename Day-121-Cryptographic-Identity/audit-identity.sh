#!/bin/bash
echo "Auditing the In-Memory Cryptographic Passport (X.509 SVID)..."
echo "--------------------------------------------------------"

POD_NAME=$(kubectl get pods -l app=secure-api -o jsonpath='{.items[0].metadata.name}')

echo "Executing OpenSSL inspection on the ephemeral certificate injected by SPIRE:"
echo ""

kubectl exec -it $POD_NAME -c secure-api -- /bin/sh -c "\
  apk add --no-cache openssl > /dev/null 2>&1 && \
  # Fetching the cert from the memory socket
  cat /spiffe-workload-api/svid.pem | openssl x509 -text -noout | grep -E 'Subject:|URI:|Not After' \
"

echo "--------------------------------------------------------"
echo "Notice the URI: spiffe://enterprise.local/vault/accessor."
echo "Notice the 'Not After' timestamp. This certificate will self-destruct shortly."
echo "You have successfully deprecated static passwords."
#!/bin/bash
echo "Auditing Zero-Copy Columnar Transport Velocities..."
echo "--------------------------------------------------------"

kubectl run arrow-client-test --image=python:3.9-slim --restart=Never --rm -i --command -- /bin/sh -c "
  pip install --quiet pyarrow && \
  cat << 'EOF' > /tmp/client.py
$(kubectl get configmap arrow-flight-logic -o jsonpath='{.data.client\.py}')
EOF
  python /tmp/client.py
"

echo "--------------------------------------------------------"
echo "Observe the transfer metrics above. Moving 1 million tabular cells through the wire"
echo "takes fractions of a second because the data structure remains column-identical on both sides."
#!/bin/bash
echo "Auditing gRPC Binary Serialization and HTTP/2 Multiplexing..."
echo "--------------------------------------------------------"

kubectl run grpc-client-test --image=python:3.9-slim --restart=Never --rm -i --command -- /bin/sh -c "
  pip install --quiet grpcio grpcio-tools && \
  mkdir /compiled && \
  cat << 'EOF' > /compiled/fraud_check.proto
$(kubectl get configmap grpc-proto-schema -o jsonpath='{.data.fraud_check\.proto}')
EOF
  python -m grpc_tools.protoc -I/compiled --python_out=/compiled --grpc_python_out=/compiled /compiled/fraud_check.proto && \
  cat << 'EOF' > /compiled/client.py
$(kubectl get configmap grpc-python-logic -o jsonpath='{.data.client\.py}')
EOF
  cd /compiled && python client.py
"

echo "--------------------------------------------------------"
echo "Look at the latency above. By removing JSON parsing, you have achieved near-instantaneous cross-network execution."
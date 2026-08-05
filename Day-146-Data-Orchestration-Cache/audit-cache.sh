#!/bin/bash
echo "Auditing Distributed Storage Cache Telemetry..."
echo "--------------------------------------------------------"

MASTER_POD=$(kubectl get pods -n storage-cache -l app=alluxio-master -o jsonpath='{.items[0].metadata.name}')

echo "Extracting live Alluxio filesystem infrastructure report:"
echo "Command: alluxio fsadmin report"
echo "--------------------------------------------------------"

kubectl exec -n storage-cache $MASTER_POD -- alluxio fsadmin report

echo ""
echo "--------------------------------------------------------"
echo "Analyze the 'Tiered Storage Info' line in the output."
echo "If the SSD/NVMe allocation usage fluctuates while remote storage operations show minimal traffic,"
echo "your data virtualization loop is operational. You have successfully bypassed network-bound I/O blocks."
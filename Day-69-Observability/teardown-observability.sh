#!/bin/bash
echo "Executing clean teardown of Observability Architecture..."
kubectl delete deployment telemetry-api
kubectl delete svc telemetry-svc
kubectl delete servicemonitor api-monitor
helm uninstall enterprise-metrics -n observability
kubectl delete namespace observability
echo "Teardown complete. Cockpit dismantled."
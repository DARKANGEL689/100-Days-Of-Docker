#!/bin/bash
echo "AUDITING THE HOST CLUSTER (The True Reality)"
echo "---------------------------------------"
echo "Querying the physical 'enterprise-tenant-1' namespace:"
kubectl get pods -n enterprise-tenant-1
echo "---------------------------------------"
echo "Look closely at the output!"
echo "The host cluster physically runs the developer's pods, but it cryptographically mutates their names"
echo "(e.g., 'shadow-api-x-default-x-matrix-cluster') to absolutely guarantee they never collide with other tenants."
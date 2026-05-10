#!/bin/bash
echo "Executing clean teardown of Batch Architecture..."
kubectl delete jobs --all
kubectl delete cronjobs --all
echo "Teardown complete. Cluster restored to baseline."

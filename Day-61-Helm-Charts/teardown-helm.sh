#!/bin/bash
echo "Executing clean teardown of Helm Release..."
helm uninstall v1-alpha
echo "Teardown complete. Cluster restored to baseline."
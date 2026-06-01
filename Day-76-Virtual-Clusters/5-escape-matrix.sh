#!/bin/bash
echo "Disconnecting from Virtual API Server..."
./vcluster.exe disconnect
echo "Kubeconfig context restored. Welcome back to the Real World (Host Cluster)."
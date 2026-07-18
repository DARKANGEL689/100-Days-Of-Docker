#!/bin/bash
echo "Downloading vCluster Hypervisor CLI..."
curl -s -L -o vcluster "https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-linux-amd64"
chmod +x vcluster
sudo mv vcluster /usr/local/bin/

echo "vCluster CLI is ONLINE. Host cluster is ready to nest virtual control planes."
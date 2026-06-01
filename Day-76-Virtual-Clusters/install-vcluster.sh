#!/bin/bash
echo "Downloading Virtual Cluster Synthesis Engine (vcluster CLI)..."
curl -s -L -o vcluster.exe "https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-windows-amd64.exe"
chmod +x vcluster.exe
echo "Engine downloaded. Ready for synthesis."
#!/bin/bash
echo "Downloading K8sGPT AI SRE Engine..."
curl -sL -o k8sgpt.tar.gz https://github.com/k8sgpt-ai/k8sgpt/releases/download/v0.3.24/k8sgpt_Windows_x86_64.tar.gz
tar -xzf k8sgpt.tar.gz
mv k8sgpt.exe k8sgpt-engine.exe
rm k8sgpt.tar.gz

echo "Initializing AI Engine..."
./k8sgpt-engine.exe version

echo "--------------------------------------------------------"
echo "K8sGPT is ONLINE. The cluster is now under AI surveillance."
echo "Note: To use the plain-English explanation feature later, you will need a free OpenAI or LocalAI API key."
echo "--------------------------------------------------------"
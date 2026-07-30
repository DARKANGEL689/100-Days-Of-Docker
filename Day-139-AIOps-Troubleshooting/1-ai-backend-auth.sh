#!/bin/bash
echo "Authenticating the AIOps Engine..."


k8sgpt auth add --backend openai --password "sk-YOUR_SECURE_API_KEY_HERE"

echo "LLM Backend successfully bound to the Kubernetes diagnostic analyzers."
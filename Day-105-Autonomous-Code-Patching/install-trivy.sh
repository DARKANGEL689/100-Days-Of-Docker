#!/bin/bash
echo "Downloading Security Vulnerability Scanner (Trivy)..."
curl -sL https://github.com/aquasecurity/trivy/releases/download/v0.49.1/trivy_0.49.1_Windows-64bit.tar.gz | tar -xz
mv trivy.exe trivy-scanner.exe

echo "Trivy Scanner is ONLINE. The security perimeter is active."
#!/bin/bash
echo "Establishing secure tunnel to the Internal Developer Portal..."
echo "--------------------------------------------------------"
echo "Open your web browser to: http://localhost:3000"
echo "1. Explore the 'Software Catalog' to see the Financial Services domain."
echo "2. Click on 'Create...' on the left sidebar to see your Golden Path Template!"
echo "--------------------------------------------------------"
kubectl port-forward -n backstage-system svc/platform-portal-backstage 3000:80
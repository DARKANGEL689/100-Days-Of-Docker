#!/bin/bash
echo "Opening the Distributed Tracing X-Ray Dashboard..."
echo "--------------------------------------------------"
echo "1. Open your browser to: http://localhost:16686"
echo "2. On the left menu, under 'Service', select 'frontend'."
echo "3. Click the blue 'Find Traces' button at the bottom."
echo "4. Click on any of the traces to view the visual waterfall breakdown!"
echo "--------------------------------------------------"
kubectl port-forward svc/jaeger-collector 16686:16686
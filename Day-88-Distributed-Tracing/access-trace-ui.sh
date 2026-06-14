#!/bin/bash
echo "Establishing secure tunnel to the Jaeger Telemetry Dashboard..."
echo "--------------------------------------------------------"
echo "1. Open your web browser to: http://localhost:16686"
echo "2. On the left side under 'Service', select 'frontend'."
echo "3. Click 'Find Traces' at the bottom."
echo "4. Click on one of the traces to see the exact millisecond execution time of every function across all 4 microservices!"
echo "--------------------------------------------------------"
kubectl port-forward svc/jaeger-svc 16686:16686
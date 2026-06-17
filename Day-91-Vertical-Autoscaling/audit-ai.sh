#!/bin/bash
echo "Auditing VPA Algorithmic Recommendations..."
echo "(Allowing 60 seconds for the Recommender to build the mathematical model...)"
sleep 60

echo "--------------------------------------------------------"
echo "Querying the Recommender API:"
kubectl describe vpa monolith-vpa
echo "--------------------------------------------------------"
echo "Scroll up in the output and look for the 'Recommendation:' block."
echo "You will see Target, Lower Bound, and Upper Bound."
echo "Notice how the recommended Target CPU is vastly higher than our original 10m request!"
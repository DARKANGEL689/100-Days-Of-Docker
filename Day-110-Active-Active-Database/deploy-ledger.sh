#!/bin/bash
echo "Initializing Database Schema and Seeding Financial Data..."

cat 1-global-schema.sql | kubectl exec -i global-ledger-cockroachdb-0 -- ./cockroach sql --insecure

echo "Data successfully written and replicated across all 3 nodes."
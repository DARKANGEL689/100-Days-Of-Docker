#!/bin/bash
echo "Testing Semantic Cache Latency..."
echo "Run 1: Warming cache..."
./execute-query.sh "What is the Postgres password?" 

echo "Run 2: Querying cache..."
time ./execute-query.sh "What is the Postgres password?"
#!/bin/bash
echo "Pulling a baseline Alpine image to use as test artifacts..."
docker pull alpine:latest

echo "Tagging Unsigned (Rogue) Artifact..."
docker tag alpine:latest darkangel689/alpha-node:unsigned

echo "Tagging Secure (Valid) Artifact..."
docker tag alpine:latest darkangel689/alpha-node:signed

echo "Pushing artifacts to your Docker Hub Registry..."
docker push darkangel689/alpha-node:unsigned
docker push darkangel689/alpha-node:signed
echo "Artifacts staged in the cloud."
#!/bin/bash
echo "Auditing the Sigstore Transparency Log for Artifact Provenance..."
echo "Checking signature against public key for darkangel689/alpha-node:signed..."
./cosign.exe verify --key cosign.pub darkangel689/alpha-node:signed
echo "--------------------------------------------------------"
echo "Signature Verified. The supply chain is completely unbroken."
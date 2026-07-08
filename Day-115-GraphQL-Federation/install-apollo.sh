#!/bin/bash
echo "Downloading Apollo Rover CLI (Supergraph Compiler)..."
curl -sSL https://rover.apollo.dev/nix/latest | sh
export PATH="$HOME/.rover/bin:$PATH"

echo "Rover Compiler is ONLINE."
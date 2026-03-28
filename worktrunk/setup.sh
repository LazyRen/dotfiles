#!/usr/bin/env bash
set -euo pipefail

# Install shell integration
if command -v wt &>/dev/null; then
  wt config shell install -y
fi

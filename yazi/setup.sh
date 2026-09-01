#!/usr/bin/env bash
set -euo pipefail

# Install packages, or upgrade if already installed
ya pkg install --discard 2>/dev/null || ya pkg upgrade --discard

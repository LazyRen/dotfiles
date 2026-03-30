#!/usr/bin/env bash
set -euo pipefail

# Bootstrap plugins
if command -v nvim &>/dev/null; then
  nvim --headless "+MasonInstallAll" "+TSInstallAll" +qa 2>/dev/null || true
fi

#!/usr/bin/env bash
set -euo pipefail

PLUGIN_DIR="$HOME/.config/zellij/plugins"
mkdir -p "$PLUGIN_DIR"

plugins=(
  "rvcas/room/room.wasm"
  "dj95/zjstatus/zjstatus.wasm"
  "dj95/zjstatus/zjframes.wasm"
)

for plugin in "${plugins[@]}"; do
  repo="${plugin%/*}"
  file="${plugin##*/}"
  if [[ ! -f "$PLUGIN_DIR/$file" ]]; then
    echo "Installing zellij plugin: $file"
    curl -L "https://github.com/$repo/releases/latest/download/$file" -o "$PLUGIN_DIR/$file"
  fi
done

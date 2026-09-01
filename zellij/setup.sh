#!/usr/bin/env bash
set -euo pipefail

PLUGIN_DIR="$HOME/.config/zellij/plugins"
mkdir -p "$PLUGIN_DIR"

plugins=(
  "rvcas/room/room.wasm"
  "dj95/zjstatus/zjstatus.wasm"
  "dj95/zjstatus/zjframes.wasm"
  "liam-mackie/zsm/zsm.wasm"
  "drop-stones/zellij-loom/zellij-loom.wasm"
  "fresh2dev/zellij-autolock/zellij-autolock.wasm"
  "KiryuuLight/zellij-attention/zellij-attention.wasm"
  "hiasr/vim-zellij-navigator/vim-zellij-navigator.wasm"
)

for plugin in "${plugins[@]}"; do
  repo="${plugin%/*}"
  file="${plugin##*/}"
  echo "Installing zellij plugin: $file"
  if ! curl -sfL -z "$PLUGIN_DIR/$file" -o "$PLUGIN_DIR/$file" "https://github.com/$repo/releases/latest/download/$file"; then
    echo "  Warning: Failed to download $file"
  fi
done

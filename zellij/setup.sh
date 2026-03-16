#!/usr/bin/env bash

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
  echo "Installing zellij plugin: $file"
  curl -L "https://github.com/$repo/releases/latest/download/$file" -o "$PLUGIN_DIR/$file"
done

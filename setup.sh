#!/bin/bash

# WezTerm configuration setup script
mkdir -p ~/.config/wezterm

for file in "$(dirname "$0")"/wezterm/*.lua; do
  [ -e "$file" ] || continue
  file="$(realpath "$file")"
  ln -sf "$file" "$HOME/.config/wezterm/$(basename "$file")"
done

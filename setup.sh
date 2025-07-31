#!/bin/bash

echo "$(dirname "$0")/wezterm"
ln -sf "$(realpath "$(dirname "$0")/wezterm")" "$HOME/.config/wezterm"

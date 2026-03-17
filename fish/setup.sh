#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Create local.fish template if it doesn't exist (gitignored, stowed by stow)
LOCAL_FISH="$SCRIPT_DIR/.config/fish/conf.d/local.fish"
if [ ! -f "$LOCAL_FISH" ]; then
  cat > "$LOCAL_FISH" << 'FISH'
# Machine-local Fish configuration.
#
# This file is stowed to ~/.config/fish/conf.d/local.fish but is NOT
# tracked by git (.gitignore). Use it for machine-specific settings
# such as environment variables, PATH additions, or aliases that
# should not be shared across machines.
#
# Recreated as an empty template by fish/setup.sh on fresh clones.
FISH
fi

# Bootstrap fisher and install plugins
fish -c "
  if not functions -q fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    fisher install jorgebucaran/fisher
  end
  fisher update
"

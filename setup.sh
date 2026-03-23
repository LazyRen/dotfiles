#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
IS_MAC=false
[[ "$(uname)" == "Darwin" ]] && IS_MAC=true
SKIP_BREW=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --skip-brew) SKIP_BREW=true; shift ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
done

# --- Helpers ---
parse_yaml_list() {
  local file="$1"
  while IFS= read -r line; do
    case "$line" in
      "  - "*) echo "${line#  - }" ;;
    esac
  done < "$file"
}

ensure_brew() {
  if command -v brew &>/dev/null; then
    return 0
  fi

  echo "Installing Homebrew..."
  "$DOTFILES_DIR/brew/install.sh"
  eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || \
          /home/linuxbrew/.linuxbrew/bin/brew shellenv 2>/dev/null)"

  command -v brew &>/dev/null
}

install_brew_packages() {
  local section=""
  while IFS= read -r line; do
    case "$line" in
      "formula:")     section="formula" ;;
      "formula_mac:") section="formula_mac" ;;
      "cask:")        section="cask" ;;
      "link:")        section="link" ;;
      "  - "*)
        local pkg="${line#  - }"
        case "$section" in
          formula)     brew install "$pkg" ;;
          formula_mac) $IS_MAC && brew install "$pkg" ;;
          cask)        $IS_MAC && brew install --cask "$pkg" ;;
          link)        brew link "$pkg" --force --overwrite ;;
        esac
        ;;
    esac
  done < "$DOTFILES_DIR/brew/list.yaml"
}

backup_and_stow() {
  local backup_dir="$DOTFILES_DIR/.backup/$(date +%Y%m%d_%H%M%S)"
  local conflicts
  conflicts=$(stow --no --target="$HOME" --dir="$DOTFILES_DIR" "$@" 2>&1) || true

  if echo "$conflicts" | grep -q "existing target"; then
    mkdir -p "$backup_dir"
    echo "$conflicts" | grep "existing target" | sed 's/.*existing target //' | sed 's/ since.*//' | while read -r file; do
      local target="$HOME/$file"
      if [[ -e "$target" && ! -L "$target" ]]; then
        mkdir -p "$backup_dir/$(dirname "$file")"
        mv "$target" "$backup_dir/$file"
        echo "Backed up $file → $backup_dir/$file"
      fi
    done
  fi

  stow --restow --target="$HOME" --dir="$DOTFILES_DIR" "$@"
}

run_hooks() {
  for app in "$@"; do
    local hook="$DOTFILES_DIR/$app/setup.sh"
    if [[ -x "$hook" ]]; then
      echo "Running $app/setup.sh"
      "$hook"
    fi
  done
}

# --- Main ---
apps=()
while IFS= read -r app; do
  apps+=("$app")
done < <(parse_yaml_list "$DOTFILES_DIR/config.yaml")

# Filter OS-specific packages
filtered=()
for app in "${apps[@]}"; do
  [[ "$app" == os/mac && "$IS_MAC" == false ]] && continue
  filtered+=("$app")
done
apps=("${filtered[@]}")

# Split into stowable (top-level) and hook-only (nested)
stow_apps=()
for app in "${apps[@]}"; do
  [[ "$app" != */* ]] && stow_apps+=("$app")
done

if ! $SKIP_BREW; then
  if ensure_brew; then
    install_brew_packages
  else
    echo "WARNING: brew not found, skipping package installation"
  fi
else
  echo "Skipping brew (--skip-brew)"
fi

if [[ ${#stow_apps[@]} -gt 0 ]]; then
  backup_and_stow "${stow_apps[@]}"
fi
run_hooks "${apps[@]}"

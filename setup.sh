#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(realpath "$(dirname "$0")")"
IS_MAC=$([[ "$(uname)" == "Darwin" ]] && echo true || echo false)
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
      "formula:") section="formula" ;;
      "cask:")    section="cask" ;;
      "  - "*)
        local pkg="${line#  - }"
        case "$section" in
          formula) brew install "$pkg" ;;
          cask)    $IS_MAC && brew install --cask "$pkg" ;;
        esac
        ;;
    esac
  done < "$DOTFILES_DIR/brew/list.yaml"
}

backup_and_stow() {
  local backup_dir="$DOTFILES_DIR/.backup/$(date +%Y%m%d_%H%M%S)"
  local conflicts
  conflicts=$(stow --no --target="$HOME" --dir="$DOTFILES_DIR" "$@" 2>&1) || true

  if echo "$conflicts" | grep -q "existing target is"; then
    mkdir -p "$backup_dir"
    echo "$conflicts" | grep "existing target is" | sed 's/.*: //' | while read -r file; do
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
mapfile -t apps < <(parse_yaml_list "$DOTFILES_DIR/config.yaml")

if ! $SKIP_BREW; then
  if ensure_brew; then
    install_brew_packages
  else
    echo "WARNING: brew not found, skipping package installation"
  fi
else
  echo "Skipping brew (--skip-brew)"
fi

if [[ " ${apps[*]} " == *" zsh "* ]] && [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

backup_and_stow "${apps[@]}"
run_hooks "${apps[@]}"

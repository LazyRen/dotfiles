#!/usr/bin/env bash

DOTFILES_DIR="$(realpath "$(dirname "$0")")"

# --- Parse config ---
apps=()
while IFS= read -r line; do
  case "$line" in
    "  - "*)
      apps+=("${line#  - }")
      ;;
  esac
done < "$DOTFILES_DIR/config.yaml"

# --- Brew ---
if command -v brew &>/dev/null; then
  brew_list="$DOTFILES_DIR/brew/list.yaml"
  section=""
  while IFS= read -r line; do
    case "$line" in
      "formula:") section="formula" ;;
      "cask:")    section="cask" ;;
      "  - "*)
        pkg="${line#  - }"
        case "$section" in
          formula) brew install "$pkg" ;;
          cask)    brew install --cask "$pkg" ;;
        esac
        ;;
    esac
  done < "$brew_list"
else
  echo "WARNING: brew not found, skipping package installation"
fi

# --- Oh My Zsh ---
if [[ " ${apps[*]} " == *" zsh "* ]] && [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# --- Stow configs ---
stow --restow --target="$HOME" --dir="$DOTFILES_DIR" "${apps[@]}"

# --- Post-setup hooks ---
for app in "${apps[@]}"; do
  hook="$DOTFILES_DIR/$app/setup.sh"
  if [[ -x "$hook" ]]; then
    echo "Running $app/setup.sh"
    "$hook"
  fi
done

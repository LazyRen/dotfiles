#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
IS_MAC=false
[[ "$(uname)" == "Darwin" ]] && IS_MAC=true
SKIP_BREW=false
THEME=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --skip-brew)  SKIP_BREW=true; shift ;;
    --theme) THEME=true; shift ;;
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

parse_yaml_scalar() {
  local file="$1" key="$2"
  while IFS= read -r line; do
    case "$line" in
      "${key}: "*)
        local val="${line#"${key}": }"
        val="${val#\"}" ; val="${val%\"}"
        echo "$val"
        return ;;
    esac
  done < "$file"
}

parse_theme() {
  local theme_file="$1"
  THEME_KEYS=()
  THEME_VALS=()
  while IFS= read -r line; do
    [[ "$line" =~ ^#.*$ || -z "$line" ]] && continue
    local key="${line%%:*}"
    local val="${line#*: }"
    val="${val#\"}" ; val="${val%\"}"
    THEME_KEYS+=("$key")
    THEME_VALS+=("$val")
  done < "$theme_file"
}

render_templates() {
  local dir="$1"
  while IFS= read -r -d '' tmpl; do
    local out="${tmpl%.tmpl}"
    local sed_args=()
    for i in "${!THEME_KEYS[@]}"; do
      sed_args+=(-e "s/{{${THEME_KEYS[$i]}}}/${THEME_VALS[$i]}/g")
    done
    sed "${sed_args[@]}" "$tmpl" > "$out"
    echo "Rendered ${out#"$DOTFILES_DIR"/}"
  done < <(find "$dir" -name '*.tmpl' -print0)
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

# Render theme templates
theme_name=$(parse_yaml_scalar "$DOTFILES_DIR/config.yaml" "theme")
if [[ -n "$theme_name" ]]; then
  theme_file="$DOTFILES_DIR/themes/${theme_name}.yaml"
  if [[ -f "$theme_file" ]]; then
    echo "Applying theme: $theme_name"
    parse_theme "$theme_file"
    render_templates "$DOTFILES_DIR"
  else
    echo "WARNING: theme file not found: $theme_file"
  fi
fi

if $THEME; then
  echo "Done (--theme)"
  exit 0
fi

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

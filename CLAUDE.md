# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Dotfiles repository managing configurations for: Ghostty, Fish, Starship, Zellij, (and optionally Wezterm, Zsh). Uses GNU Stow for symlink management.

## Setup & Installation

```bash
./setup.sh
```

`setup.sh` runs four steps in order:
1. Reads active app list from `config.yaml`
2. Installs Homebrew packages from `brew/list.yaml` (skipped if `brew` not found)
3. Installs Oh My Zsh if `zsh` is in the app list
4. Stows all apps via `stow --restow -t ~`
5. Runs per-app `setup.sh` hooks (e.g., `fish/setup.sh` bootstraps fisher, `zellij/setup.sh` downloads WASM plugins)

## Architecture

### Config

- `config.yaml` — single source of truth for which apps to stow. Comment out a line to disable.
- `brew/list.yaml` — Homebrew formulas and casks (casks are macOS-only).

### Stow Layout

Each package directory mirrors `$HOME`. Stow creates symlinks from `$HOME` into the repo:

```
<package>/.config/<app>/       →  ~/.config/<app>/
zsh/.oh-my-zsh/custom/         →  ~/.oh-my-zsh/custom/
starship/.config/starship.toml →  ~/.config/starship.toml
```

Packages with `setup.sh` hooks need a `.stow-local-ignore` file (includes stow defaults + `setup\.sh`) since it replaces stow's built-in ignore list.

### Fish Shell

- `config.fish` initializes: brew, zoxide, starship, fzf, atuin, mise
- Fisher plugin manager with plugins defined in `fish_plugins` (done, autopair, sponge)
- `fish/setup.sh` bootstraps fisher and installs plugins
- Gerrit functions (`gpg`, `gpgwip`, `gpgready`) wrap `git push` for code review — **not** related to GPG encryption

### Cross-Application Conventions

- **Font**: JetBrainsMono Nerd Font
- **Theme**: OneDark / One-Half-Dark family
- **Navigation**: Vim-style (hjkl) keybindings in multiplexers/terminals
